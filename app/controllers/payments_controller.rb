class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def create
    # to acces hidden field parameter in product page
    @product = Product.find(params[:product_id])
    @user = current_user

    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: (@product.price * 100).to_i,
        currency: "eur",
        source: token,
        description: params[:stripeEmail]
      )

      if charge.paid
        UserMailer.order_confirmation(@user, @product).deliver_now
        Order.create!(
          product_id: @product.id,
          user_id: @user.id,
          total: @product.price
        )
      end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Oh no! Your payment could not be processed due to an error: #{err[:message]}"
    end

    # redirect_to product_path(@product), notice: "Thank you for your purchase."

  end

end
