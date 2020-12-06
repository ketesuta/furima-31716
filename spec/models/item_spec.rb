require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("spec/files/test_image.png")
    @item.user = @user

  end
  
  describe '商品出品' do
    context "出品できる時" do

      it '全て正常なら出品できる' do
        expect(@item).to be_valid
      end
    end

  
    context '出品できない時' do

      it 'ログインしていない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it '商品画像がない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品説明の記入がされていない' do
        @item.item_explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explanation can't be blank")
      end

      it 'カテゴリーの記入がされていない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end

      it '商品の状態の記入がされていない' do
        @item.item_status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank", "Item status is not a number")
      end

      it '配送料の負担が記入されていない' do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end

      it '発送元の地域について記述されていない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end

      it '発送までの日数が記述されていない' do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank", "Days to ship is not a number")
      end

      it '価格が記述されていない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
      end

      it '価格の範囲が¥300~¥9,999,999の間' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      
      it '価格の範囲が¥300~¥9,999,999の間' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '販売価格は半角英数で記述されていない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'カテゴリーがid１の時' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end

      it '商品の状態がid１の時' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end

      it '発送料の負担のid１の時' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end

      it '発送元の地域のid１の時' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end

      it '発送までの日にちのid１の時' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end

      
    end
  end

end
