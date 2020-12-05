class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_items, only: [:edit, :update, :show, :destroy]
  before_action :set_move_to, only: [:edit, :destroy]
  before_action :edit_buy_item, only: :edit
  def index
    @items = Item.order("created_at DESC")
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
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
    params.require(:item).permit(:item_name, :item_explanation, :category_id, :item_status_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_items
    @item = Item.find(params[:id])
  end

  def set_move_to
    unless current_user == @item.user
      redirect_to root_path
    end
  end


  def edit_buy_item
    if @item.buy_item.present?
      redirect_to root_path
    end
    
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
