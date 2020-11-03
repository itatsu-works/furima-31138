class SoldsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    sold_item_new
    find_item

  end
  
  def create
    @sold_item = SoldItem.new(delivery_params)

    if @sold_item.valid?
      @sold_item.save
    redirect_to root_path
    else
      binding.pry
      find_item
      sold_item_new
      render 'index'
    end
    
  end

  private
  def find_item
    @item = Item.find(params[:item_id])
  end
  def sold_item_new
    @sold_item = SoldItem.new
  end

  def delivery_params
    params.require(:sold_item).permit(:post_number, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
end
