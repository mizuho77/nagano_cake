class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:image)
  end
end
