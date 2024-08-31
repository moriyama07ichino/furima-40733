require 'rails_helper'

RSpec.describe "Order", type: :feature do
  let(:user) { create(:user) }
  let(:item) { create(:item) }

  scenario '購入が完了したら、トップページに遷移すること' do
    sign_in user
    visit new_item_order_path(item)
    fill_in '郵便番号', with: '123-4567'
    select '東京都', from: '都道府県'
    fill_in '市区町村', with: '渋谷区'
    fill_in '番地', with: '原宿1-1'
    fill_in '電話番号', with: '09012345678'
    fill_in 'カード番号', with: '4242424242424242'
    fill_in '有効期限（月）', with: '12'
    fill_in '有効期限（年）', with: '23'
    fill_in 'セキュリティコード', with: '123'
    click_button '購入'

    expect(page).to have_content 'トップページにようこそ'
  end

  scenario '購入ページでエラーメッセージが表示されること' do
    sign_in user
    visit new_item_order_path(item)
    fill_in '郵便番号', with: ''
    click_button '購入'

    expect(page).to have_content '郵便番号が入力されていません'
  end
end