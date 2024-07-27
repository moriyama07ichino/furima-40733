FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { 'test@example.com' }
    password { 'password123' } # 6文字以上の半角英数字
    password_confirmation { 'password123' } # passwordと一致
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { '2000-01-01' }
  end
end