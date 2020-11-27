class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belomgs_to :category
  validates :imege, :item_name, :item_explanation, presence: true

  validates :category_id, numericality: { other_than: 1 }
end
