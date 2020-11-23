# テーブル設計


  ## users テーブル
  
  | Column | Type | Options |
  | ------ | ---- | ------- |
  | nickname | string | null: false|
  | email | string | null: false, unique: true |
  | encrypted_password | string | null: false |
  | first_name | string |null: false |
  | last_name | string | null: false |
  | first_name_kana | string | null: false |
  | last_name_kana | string | null: false |
  | birthday | date | null: false |

  ### Association
  - has_many :items
  - has_many :comments
  - has_many :items_buys


 ## items テーブル

  | Column | Type | Options |
  | ------ |----- | ------- |
  | item_name | string | null: false |
  | item_explanation(商品説明) | text | null: false |
  | category_id | integer | null: false |
  | item_status_id | integer | null: false |
  | shipping_charge_id(配送料) | integer | null: false |
  | prefecture_id(発送元の地域(都道府県)) | integer | null: false |
  | days_to_ship_id(発送までの日数) | integer | null: false |
  | price(価格) | integer | null: false |
  | user(出品元のユーザー) | references | null: false, foreign_key: true |


  ### Association
  - has_one :items_buy
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


  ## items_buy(商品購入) テーブル

  | Column | Type | Options |
  | ------ | ---- | ------- |
  | user | references | null: false, foreign_key: true |
  | item | references | null: false, foreign_key: true |

  ### Association
  - belongs_to :user
  - belongs_to :item
  - has_one :street_address


  ## street_address(住所)テーブル

  | Column | Type | Options |
  | ------ | ---- | ------- |
  | postal_code(郵便番号) | string | null: false |
  | prefecture_id(都道府県) | integer | null: false |
  | municipality(市区町村) | string | null: false |
  | address(番地) | string | null: false |
  | building_name(建物名) | string | |
  | phone_number(電話番号) | string | null: false |
  | items_buy | references  | null: false, foreign_key: true|

  ### Association
  - belongs_to :item_buy
