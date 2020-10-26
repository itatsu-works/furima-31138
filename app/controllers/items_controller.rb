class ItemsController < ApplicationController
  def index
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:user_id, :price, :days_id, :area_id, :cost_burden_id, :status_id, :category_id, :description, :name, :image).merge(user_id: current_user.id)
  end
end
