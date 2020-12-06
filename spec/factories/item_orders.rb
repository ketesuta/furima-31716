FactoryBot.define do
  factory :item_order do
    postal_code {"111-1111"}
    prefecture_id {2}
    municipality {"品川"}
    address {"3番地"}
    building_name {""}
    phone_number {"0901111111"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
