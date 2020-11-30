class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def get
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit
    (:item_name,:item_explanation, :category_id, :items_status,:shipping_charge_id,:prefecture_id, :days_to_ship_id,:price, :image).merge(user_id: current_user.id)
  end
end
