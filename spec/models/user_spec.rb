require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemailとpasswordとpassword_confirmationとfirst_nameとlast_nameとfirst_name_kanaとlast_name_kanaとbirthdayの記述があっていれば新規登録できる" do
        @user = User.new(nickname:"a",email: "kkk@gmail.com", password: "11111a", password_confirmation: "11111a",first_name: "山田",last_name: "太郎",first_name_kana: "ヤマダ",last_name_kana: "タロウ",birthday: 2000/ 1 / 1 )
        expect(@user).to be_valid
      end
      it "メールアドレスが存在している" do
        @user.email = "abc@gmail.com"
        expect(@user).to be_valid
      end
      it "メールアドレスに@がある時" do
        @user.email = "abc@gmail.com"
        expect(@user).to be_valid
      end
      it "パスワードが存在している時" do
        @user.password = "12345a"
        @user.password_confirmation = "12345a"
        expect(@user).to be_valid
      end
      it "パスワードが６文字以上の時" do
        @user.password = "12345a"
        @user.password_confirmation = "12345a"
        expect(@user).to be_valid
      end
      it "パスワードとパスワード（確認用）、値の一致している時" do
        @user.password = "12345a"
        @user.password_confirmation = "12345a"
        expect(@user).to be_valid
      end
    end

    context '登録がうまくいかないとき' do
      it "メールアドレスが存在してない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "メールアドレスに@がない時" do
        @user.email = "abcgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "パスワードが存在していない時" do
        @user.password = ""
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password can't be blank", "Password は半角6~12文字英小文字・数字それぞれ１文字以上含む必要があります")
      end
      it "パスワードが5文字以下の時" do
        @user.password = "1234a"
        @user.password_confirmation = "1234a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password は半角6~12文字英小文字・数字それぞれ１文字以上含む必要があります")
      end
      it "パスワードとパスワード（確認用）、値の一致していない時" do
        @user.password = "12345a"
        @user.password_confirmation = "12346a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

  end
end
