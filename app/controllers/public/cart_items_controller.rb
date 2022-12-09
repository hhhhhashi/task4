class Public::CartItemsController < ApplicationController
  def index
    @cart_items=CartItem.all
  end

  def create
    @cart_item=CartItem.new(cart_item_params)
    @cart_item.customer_id=current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end

  #def total_price
    #cart_items.to_a.sum { |item|item.total_price }
  #end

  def update
  end

  def destroy
    cart_item=CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items=current_customer.cart_items
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end


end
