class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    #@items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to :action => "new"
    else
      render :action => "new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to :action => "index"
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :img_url)
  end
end
