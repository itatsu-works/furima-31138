class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new]
  def index
    @item = Item.all.order(created_at: "DESC")
  end

  def show
    @item = Item.find(params[:id])
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

  def move_to_index
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
end
