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
      it "重複したメールアドレスが存在する時" do
        @user.save
        anothr_user = FactoryBot.build(:user, email: "abc@gmail.com" )
        expect(anothr_user).to be_valid
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
      it "パスワードは、半角英数字混合での入力ができている" do
        @user.password = "12345a"
        @user.password_confirmation = "12345a"
        expect(@user).to be_valid
      end
      it "ユーザー本名は、名字と名前がそれぞれ入力されている" do
        @user.first_name = "山田"
        @user.last_name = "太郎"
        expect(@user).to be_valid
      end
      it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力ができている" do
        @user.first_name = "山田"
        @user.last_name = "太郎"
        expect(@user).to be_valid
      end
      it "ユーザー本名のフリガナは、名字と名前がそれぞれ入力されている" do
        @user.first_name_kana = "フリ"
        @user.last_name_kana = "ガナ"
        expect(@user).to be_valid
      end
      it "ユーザー本名のフリガナは、全角（カタカナ）での入力がされている" do
        @user.first_name_kana = "フリ"
        @user.last_name_kana = "ガナ"
        expect(@user).to be_valid
      end
      it "生年月日が入力されている" do
        @user.birthday = "2000/1/1"
        expect(@user).to be_valid
      end
    end

    context '登録がうまくいかないとき' do
      it "メールアドレスが存在してない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "メールアドレスに@がない時" do
        @user.email = "abcgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "重複したメールアドレスが存在する時" do
        @user.save
        anothr_user = FactoryBot.build(:user, email: @user.email)
        anothr_user.valid?
        expect(anothr_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "パスワードが存在していない時" do
        @user.password = ""
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは半角6~12文字英小文字・数字それぞれ１文字以上含む必要があります")
      end
      it "パスワードが5文字以下の時" do
        @user.password = "1234a"
        @user.password_confirmation = "1234a"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください", "パスワードは半角6~12文字英小文字・数字それぞれ１文字以上含む必要があります")
      end
      it "パスワードとパスワード（確認用）、値の一致していない時" do
        @user.password = "12345a"
        @user.password_confirmation = "12346a"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "パスワードは、半角英数字混合での入力ができていない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角6~12文字英小文字・数字それぞれ１文字以上含む必要があります")
      end
      it "ユーザー本名は、名字と名前がそれぞれ入力されていない" do
        @user.first_name = ""
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください", "名字は不正な値です", "名前を入力してください", "名前は不正な値です")
      end
      it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力がされていない" do
        @user.first_name = "a"
        @user.last_name = "b"
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は不正な値です", "名前は不正な値です")
      end
      it "ユーザー本名のフリガナは、名字と名前がそれぞれ入力されていない" do
        @user.first_name_kana = ""
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ミョウジを入力してください", "ミョウジは不正な値です", "ナマエを入力してください", "ナマエは不正な値です")
      end
      it "ユーザー本名のフリガナは、全角（カタカナ）での入力がされていない" do
        @user.first_name_kana = "huri"
        @user.last_name_kana = "gana"
        @user.valid?
        expect(@user.errors.full_messages).to include("ミョウジは不正な値です", "ナマエは不正な値です")
      end
      it "生年月日が入力されていない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end

  end
end
