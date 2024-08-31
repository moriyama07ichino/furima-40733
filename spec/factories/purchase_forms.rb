FactoryBot.define do
  factory :purchase_form do
    transient do
      user { FactoryBot.create(:user) }
      item { FactoryBot.create(:item) }
    end

    token { "tok_abcdefghijk00000000000000000" }
    postal_code { "123-4567" }
    prefecture_id { 1 }
    city { "渋谷区" }
    address { "1-1" }
    building_name { "テストビル" }
    phone_number { "09012345678" }

    after(:build) do |purchase_form, evaluator|
      purchase_form.user_id = evaluator.user.id
      purchase_form.item_id = evaluator.item.id
    end
  end
end