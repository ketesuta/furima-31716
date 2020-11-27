class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belomgs_to :category
  belomgs_to :item_status


  validates :imege, :item_name, :item_explanation, presence: true

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :shipping_charge_id
  end
end
