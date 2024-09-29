require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'バリデーションのテスト' do
    context '正常ケース' do
      it '全ての属性が存在する場合、有効である' do
        expect(@item).to be_valid
      end
    end

    context '異常ケース' do
      it 'userが紐づいていない場合、無効である' do
        @item.user = nil
        @item.valid?
        expect(@item.errors[:user]).to include("must exist")
      end

      it '画像がない場合、無効である' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end

      it '名前がない場合、無効である' do
        @item.name = nil
        @item.valid?
        expect(@item.errors[:name]).to include("can't be blank")
      end

      it '説明がない場合、無効である' do
        @item.description = nil
        @item.valid?
        expect(@item.errors[:description]).to include("can't be blank")
      end

      # バリデーションのテストを修正
      it 'カテゴリーIDが1の場合、無効である' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors[:category_id]).to include("must be selected")
      end

      it '商品の状態IDが1の場合、無効である' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors[:condition_id]).to include("must be selected")
      end

      it '配送料の負担IDが1の場合、無効である' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors[:shipping_cost_id]).to include("must be selected")
      end

      it '発送元の地域IDが1の場合、無効である' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors[:prefecture_id]).to include("must be selected")
      end

      it '発送までの日数IDが1の場合、無効である' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors[:days_to_ship_id]).to include("must be selected")
      end

      it '価格が設定されていない場合、無効である' do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank")
      end

      it '価格が300未満の場合、無効である' do
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to include("must be greater than or equal to 300")
      end

      it '価格が10,000,000以上の場合、無効である' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors[:price]).to include("must be less than or equal to 9999999")
      end

      it '価格が数値でない場合、無効である' do
        @item.price = "abc"
        @item.valid?
        expect(@item.errors[:price]).to include("is not a number")
      end
    end
  end
end