require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)  # ここでuserを事前に作成
    @item = FactoryBot.create(:item, user: @user)  # そのuserを関連付けたitemを作成
    @order = FactoryBot.build(:order, user: @user, item: @item)
  end

  describe 'オーダーの保存' do
    context '内容に問題がない場合' do
      it '全ての項目が正しく入力されていれば保存できる' do
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'user_idが空では保存できない' do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User must exist")
      end

      it 'item_idが空では保存できない' do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item must exist")
      end
    end
  end
end