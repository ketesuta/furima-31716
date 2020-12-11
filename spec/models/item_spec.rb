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

      it '商品画像がない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it '商品名がない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品説明の記入がされていない' do
        @item.item_explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'カテゴリーの記入がid1の時' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end

      it '商品の状態の記入がid1の時' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end

      it '配送料の負担がid1の時' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end

      it '発送元の地域がid1の時' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域(都道府県)は1以外の値にしてください")
      end

      it '発送までの日数がid1の時' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
      end

      it '価格が記述されていない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください", "価格は数値で入力してください")
      end

      it '価格の範囲が¥300~¥9,999,999の間' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      
      it '価格の範囲が¥300~¥9,999,999の間' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end

      it '販売価格は半角英数で記述されていない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include()
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
