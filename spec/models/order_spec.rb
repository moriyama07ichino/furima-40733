require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: @user.id, item_id: @item.id)
  end

  describe 'オーダーの保存' do
    context '内容に問題がない場合' do
      it '全ての項目が正しく入力されていれば保存できる' do
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では保存できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      # 他のバリデーションに関するテストも追加できます
    end
  end
end