class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end

  def index
  end

  def show
  end

  def create
  end

  def confirm
    @order = Order.new(order_params)
    binding.pry
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:payment_method)
  end

end
