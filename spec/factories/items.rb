FactoryBot.define do


  factory :item do
    item_name { "a" }
    item_explanation { "a" }
    category_id {2}
    item_status_id {2}
    shipping_charge_id {2}
    prefecture_id {2}
    days_to_ship_id {2}
    price {300}
  end
end
