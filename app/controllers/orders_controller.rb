class OrdersController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  private

  def address_params
    params.permit(:postal_code, :prefecture_id,:municipality,:address,:building_name,:phone_number)
  end

  def buy_item_params
    params.merge(user_id: user.id,item_id :item.id)
  end
end
