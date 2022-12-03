class Admin::ItemsController < ApplicationController
  def index
    @items=Item.all
  end

  def new
    @item=Item.new
  end

  def create
    item = Item.new(post_image_params)
    item.save
    redirect_to admin_items_path
  end

  def show
    @item=Item.find(params[:id])
  end

  def edit
    @item=Item.find(params[:id])
  end

  def update
    item =Item.find(params[:id])
    item.update
    redirect_to admin_items_path
  end

  private

  def post_image_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_active)
  end
end
