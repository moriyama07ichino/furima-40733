require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:user) { create(:user) }
  let(:item) { create(:item, user: user) }

  context "ログイン状態のユーザー" do
    before do
      sign_in user
    end

    it "自身が出品していない販売中商品の商品購入ページに遷移できること" do
      get new_item_order_path(item)
      expect(response).to have_http_status(:success)
    end

    it "自身が出品していない売却済み商品の商品購入ページへ遷移しようとすると、トップページに遷移すること" do
      item.update(status: "sold")
      get new_item_order_path(item)
      expect(response).to redirect_to(root_path)
    end

    it "自身が出品した商品の商品購入ページに遷移しようとすると、トップページに遷移すること" do
      get new_item_order_path(own_item)
      expect(response).to redirect_to(root_path)
    end
  end

  context "ログアウト状態のユーザー" do
    it "商品購入ページに遷移しようとするとログインページにリダイレクトされること" do
      get new_item_order_path(item)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end