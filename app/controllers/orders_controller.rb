class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new(buy_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.require(:item_order).permit(:postal_code, :prefecture_id,:municipality,:address,:building_name,:phone_number).merge(user_id: current_user.id,item_id: @item.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_7857b7ffaa2b7a7b620077a9"
      Payjp::Charge.create(
        amount: @item.price,
        card: buy_params[:token],
        currency: 'jpy'
      )
  end
end
