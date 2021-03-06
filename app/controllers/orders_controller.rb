class OrdersController < ApplicationController

  # Login required for orders-access
  before_action :authenticate_user!

  def index
    @orders = Order.includes(:product).all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end

end
