class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :params_id, only: [:edit, :show, :update, :destroy]
  
  def index
    @item = Item.all.order(created_at: "DESC")
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(set_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
    # 購入機能実装後、出品者・出品者以外にかかわらず、ログイン状態のユーザーが、URLを直接入力して売却済み商品の商品情報編集ページへ遷移しようとすると、トップページに遷移すること
    
  end

  def update
    if @item.update(set_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if current_user.id == @item.user_id
      redirect_to root_path
    end
  end


  private

  def params_id
    @item = Item.find(params[:id])
  end

  def set_params
    params.require(:item).permit(:price, :day_id, :area_id, :cost_burden_id, :status_id, :category_id, :description, :name, :image).merge(user_id: current_user.id)
  end

end
