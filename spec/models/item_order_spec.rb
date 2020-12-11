require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '商品購入' do
    before do

    @item = FactoryBot.build(:item)
    @user = FactoryBot.build(:user)

    @item_order = FactoryBot.build(:item_order)
    @item_order.item_id = @item
    @item_order.user_id = @user

    end

    context "購入できる時" do

      it '全て正常なら購入できる' do
        expect(@item_order).to be_valid
      end
    end

    context "購入できない時" do
      
      it 'クレジットカードの入力がない時' do
        @item_order.token = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("クレジットカード情報を入力してください")
      end

      it '郵便番号の情報がない時' do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("郵便番号は不正な値です")
      end

      it '都道府県の情報がid1の時' do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end

      it '市区町村の情報がない時' do
        @item_order.municipality = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("市区町村を入力してください")
      end

      it '番地の情報がない時' do
        @item_order.address = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("番地を入力してください")
      end

      it '電話番号の情報がない時' do
        @item_order.phone_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("電話番号は不正な値です")
      end

      it '郵便番号にハイフンがない時' do
        @item_order.postal_code = 1111111
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("郵便番号は不正な値です")
      end

      it '電話番号が１１桁いないじゃないとき' do
        @item_order.phone_number = 011111111111
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include()
      end

      it '電話番号の最初が0じゃない時' do
        @item_order.phone_number = 1111111111
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include()
      end

      it 'user_idが空の時' do
        @item_order.user_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include()
      end

      it 'item_idが空の時' do
        @item_order.item_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include()
      end
    end

  end
end
