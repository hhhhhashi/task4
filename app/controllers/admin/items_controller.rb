class Admin::ItemsController < ApplicationController
  def index
    @items=Item.all
  end

  def new
    @item=Item.new
  end

  def create
    item = Item.new(post_image_params)
    item.user_id = current_user.id
    item.save
    redirect_to admin_items_path
  end

  def show
  end

  def edit
  end

  private

  def post_image_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_active)
  end
end
