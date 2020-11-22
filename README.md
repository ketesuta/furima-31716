# テーブル設計


  ## users テーブル
  
  | Column | Type | Options |
  | ------ | ---- | ------- |
  | nickname | string | null: false|
  | email | string | unique: true |
  | password | string | length: { minimum: 6 },半角英数字混合での入力が必須(deviseの初期設定になかったら記述する) |
  | encrypted_password | string | null: false |
  | first_name | string |null: false, /^[ぁ-んァ-ンー－]+$/ |
  | last_name | string | null: false, /^[ぁ-んァ-ンー－]+$/ |
  | first_name_kana | string | null: false, /^[ァ-ンー－]+$/ |
  | last_name_kana | string | null: false, /^[ァ-ンー－]+$/ |
  | birthday | date | null: false |

  ### Association
  - has_many :items
  - has_many :comments
  - has_many :items_buy

 ## items テーブル

  | Column | Type | Options |
  | ------ |----- | ------- |
  | image | string | null: false |
  | item_name | string | null: false |
  | category | integer | null: false |
  | item_status | integer | null: false |
  | shipping_charges(配送料) | integer | null: false |
  | shipping_area(発送元の地域) | integer | null: false |
  | days_to_ship(発送までの日数) | integer | null: false |
  | price(価格) | numeric | null: false, 300 :greater_than_or_equal_to, 9999999 :less_than_or_equal_to |
  | user(出品元のユーザー) | references | null: false, foreign_key: true |


  ### Association
  - has_one:through :items_buy
  - has_many :comments
  - belongs_to :user


  ## comments テーブル

  | Column | Type | Options |
  | ------ | ---- | ------- |
  | comment | text | null: false |
  | user | references | null: false, foreign_key: true |
  | item | references | null: false, foreign_key: true |

  ### Association
  - belongs_to :user
  - belongs_to :item

  ## items_buy テーブル

  | Column | Type | Options |
  | ------ | ---- | ------- |
  | items_buy_logs | references | null: false, foreign_key: true |
  | user | references | null: false, foreign_key: true |
  | item | references | null: false, foreign_key: true |

  ### Association
  - belongs_to :user
  - has_one:through :item
  - has_one:through :items_buy

  ## items_buy_logs テーブル

  | Column | Type | Options |
  | ------ | ---- | ------- |
  | クレジットカード決済機能（クレジットカード情報を取得するけど保存しない？）| | |
  | postal_code(郵便番号) | string | null: false, /\A\d{3}[-]\d{4}\z/ |
  | prefectures(都道府県) | integer | null: false |
  | municipality(市区町村) | string | null: false |
  | address(番地) | string | null: false |
  | building_name(建物名) | string | |
  | phone_number(電話番号) | string | null: false length: { maximum: 11 }, exclusion: { in: - }|

  ### Association

  -has_one:through :