FactoryBot.define do
  factory :user do
    nickname {"test"}
    email {"test@gmail.com"}
    password {"12345a"}
    password_confirmation {password}
    first_name {"山田"}
    last_name {"太郎"}
    first_name_kana {"ヤマダ"}
    last_name_kana {"タロウ"}
    birthday {2000/ 1 / 1}
  end
end
