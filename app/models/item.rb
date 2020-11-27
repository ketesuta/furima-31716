class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belomgs_to :category
  belomgs_to :item_status


  validates :imege, :item_name, :item_explanation, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :item_status_id, numericality: { other_than: 1 }

end
