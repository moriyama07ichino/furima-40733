FactoryBot.define do
  factory :shipping_address do
    association :order
    postal_code { "MyString" }
    prefecture_id { 1 }
    city { "MyString" }
    address { "MyString" }
    building { "MyString" }
    phone_number { "MyString" }
  end
end
