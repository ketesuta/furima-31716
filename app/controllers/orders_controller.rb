class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    if (@item.buy_item.present?) || (@item.user == current_user)
      redirect_to root_path
    end
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buy_params[:token],
        currency: 'jpy'
      )
  end

end