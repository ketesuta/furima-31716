class ItemOder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipality, :address,:building_name,:phone_number

  validates :postal_code
end