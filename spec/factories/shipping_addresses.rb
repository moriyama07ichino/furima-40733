FactoryBot.define do
  factory :shipping_address do
    association :order
    postal_code { "123-4567" }
    prefecture_id { 1 }
    city { "渋谷区" }
    address { "1-1" }
    building { "テストビル" }
    phone_number { "09012345678" }
  end
end