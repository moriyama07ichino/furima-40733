FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { 2 }
    condition_id { 2 }
    shipping_cost_id { 2 }
    prefecture_id { 2 }
    days_to_ship_id { 2 }
    association :user  

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec/support/assets/test_image.png')), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end