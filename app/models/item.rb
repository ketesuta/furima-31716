class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belomgs_to :category
  belomgs_to :item_status
  belomgs_to :shipping_charge
  belomgs_to :prefecture
  belomgs_to :days_to_ship

  validates :imege, :item_name, :item_explanation, presence: true
  validates :price, prefecture: true, 300 :greater_than_or_equal_to, 9999999 :less_than_or_equal_to 

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :days_to_ship_id
  end
end
