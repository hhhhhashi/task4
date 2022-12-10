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
    @address = Address.find(params[:order][:address_id])
    # :select_addressの中身に応じてcustomer? address? new?
    if params[:selected_address] == 0
      # current_customerからデータを挿入する
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:selected_address] == 1
      # addressのテーブル
      # :address_idという値でAddressテーブルのIDを送っているのでそれを使って探す(ex. Address.find(params[]))
      address = Address.find(params[:address_id])
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
    else
      # parameterから直接挿入
      @order.postal_code = params[:postal_code]
      @order.address = params[:address]
      @order.name = params[:name]
    end
    #binding.pry
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
