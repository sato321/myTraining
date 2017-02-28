class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
    @items = Item.all
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to :action => "new"
    else
      render :action => "new"
    end
  end
  def item_params
    params.require(:item).permit(:name, :price, :description, :img_url)
  end
end
