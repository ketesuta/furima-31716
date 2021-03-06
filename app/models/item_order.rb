class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal_code, :prefecture_id, :municipality, :address,:building_name,:phone_number, :token

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :municipality, :address, :user_id, :item_id,  presence: true
  validates :phone_number,format: {with: /\A(\d{9,11})\z/}
  validates :token, presence: true
  
  
  def save
    buy_item = BuyItem.create(user_id: user_id,item_id: item_id)
    BuyerAddre.create(buy_item_id: buy_item.id, postal_code: postal_code,prefecture_id: prefecture_id,municipality: municipality,address: address,building_name: building_name,phone_number: phone_number)
  end
end