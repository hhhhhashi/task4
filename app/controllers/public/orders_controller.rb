class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end

  def index
    @orders=current_customer.orders
    #@cart_items=current_customer.cart_items
  end

  def show
  end

  def create
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    # :select_addressの中身に応じてcustomer? address? new?
    if params[:order][:select_address] == "0"
      # current_customerからデータを挿入する
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      # addressのテーブル
      # :address_idという値でAddressテーブルのIDを送っているのでそれを使って探す(ex. Address.find(params[]))
      address = Address.find(params[:order][:address_id])
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
    else
      # parameterから直接挿入
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
    #binding.pry

    @cart_items=current_customer.cart_items
    @total_price=0
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
