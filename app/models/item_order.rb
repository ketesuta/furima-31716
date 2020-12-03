class ItemOder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipality, :address,:building_name,:phone_number

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, resence: true, numericality: { other_than: 1 }
  validates :municipality, :address, presence: true
  validates :phone_number,\d{10,11}

  def save

  end
end