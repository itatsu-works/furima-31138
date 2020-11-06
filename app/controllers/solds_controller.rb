class SoldsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :sold_user_check, only: [:index]
  before_action :find_item, only: [:index, :create]
  before_action :sold_item_check, only: [:index]

  def index
    sold_item_new
  end

  def create
    @sold_item = SoldItem.new(delivery_params)
    if @sold_item.valid?
      pay_payjp
      @sold_item.save
      redirect_to root_path
    else
      render action: :index
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
    params.require(:sold_item).permit(:post_number, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price)
  end
  def sold_user_check
    if current_user.id == find_item.user.id
      redirect_to root_path
    end
  end
  def pay_payjp
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: delivery_params[:price],
      card: delivery_params[:token],
      currency: 'jpy'
    )
  end
  def sold_item_check
    unless @item.sold.blank?
      redirect_to root_path
    end
  end
end
