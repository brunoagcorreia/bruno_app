class SimplePagesController < ApplicationController
  def index
    @products = Product.all
  end

  def landing_page
    @products = Product.all
  end

  def thank_you
    byebug
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
    # ActionMailer::Base.mail(from: @email,
    #     to: 'bruno@correia.space',
    #     subject: "A new contact form message from #{@name}",
    #     body: @message).deliver_now
  end
end
