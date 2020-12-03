class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
  end

  def new
  end

  def create
    #binding.pry #(まだparams見れてない)
    @item_order = ItemOrder.new(buy_params)
    if @item_order.vaild?
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.permit(:postal_code, :prefecture_id,:municipality,:address,:building_name,:phone_number).merge(user_id: user.id,item_id: item.id)
  end

end
