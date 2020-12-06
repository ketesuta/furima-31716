class BuyItem < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :buyer_addre
end
