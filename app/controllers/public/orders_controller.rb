class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end

  def index
    @orders=current_customer.orders
    #@order_details=current_customer.orders.order_details.all
  end

  def show
    #注文履歴詳細画面
    @order=Order.find(params[:id])
    @order_details=@order.order_details

  end

  def create
    @order= Order.new(order_params)
    #@order.status=0
    @order.save

    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_detail = @order.order_details.new
      @order_detail.item_id = cart_item.item.id
      @order_detail.price = cart_item.item.price
      @order_detail.amount = cart_item.amount
      @order_detail.making_status = 0
      @order_detail.save
    end

    @cart_items.destroy_all

    redirect_to complete_path
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

    @cart_items=current_customer.cart_items
    @total_price=0
  end

  def complete
    #注文完了画面OK
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :customer_id, :shipping_cost, :total_payment, :status)
  end

end
