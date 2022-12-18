class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
  end

  def update
    #binding.pry
    order=Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path(order)
    #binding.pry
  end
end

private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :customer_id, :shipping_cost, :total_payment, :status)
  end