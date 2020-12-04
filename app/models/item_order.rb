class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal_code, :prefecture_id, :municipality, :address,:building_name,:phone_number, :token

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :municipality, :address, :user_id, :item_id,  presence: true
  validates :phone_number,format: {with: /\A(\d{9,10})\z/}
  validates :token, presence: true
  
  
  def save
    BuyItem.create(user_id: user.id,item_id: item.id)
    BuyerAddre.create(postal_code: postal_code,prefecture: prefecture,municipality: municipality,address: address,building_name: building_name,phone_number: phone_number)
  end
end