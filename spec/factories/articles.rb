FactoryBot.define do
  factory :article do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { 1 }
    condition_id { 1 }
    shipping_cost_id { 1 }
    prefecture_id { 1 }
    days_to_ship_id { 1 }

    after(:build) do |article|
      article.image.attach(io: File.open(Rails.root.join('spec', 'support', 'assets', 'test_image.png')), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
