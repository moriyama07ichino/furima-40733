require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'バリデーションのテスト' do
    let(:article) { FactoryBot.build(:article) }

    context '正常ケース' do
      it '全ての属性が存在する場合、有効である' do
        expect(article).to be_valid
      end
    end

    context '異常ケース' do
      it '画像がない場合、無効である' do
        article.image = nil
        article.valid?
        expect(article.errors[:image]).to include("can't be blank")
      end

      it '名前がない場合、無効である' do
        article.name = nil
        article.valid?
        expect(article.errors[:name]).to include("can't be blank")
      end

      it '説明がない場合、無効である' do
        article.description = nil
        article.valid?
        expect(article.errors[:description]).to include("can't be blank")
      end

      it 'カテゴリーIDが0の場合、無効である' do
        article.category_id = 0
        article.valid?
        expect(article.errors[:category_id]).to include("must be other than 0")
      end

      it '商品の状態IDが0の場合、無効である' do
        article.condition_id = 0
        article.valid?
        expect(article.errors[:condition_id]).to include("must be other than 0")
      end

      it '配送料の負担IDが0の場合、無効である' do
        article.shipping_cost_id = 0
        article.valid?
        expect(article.errors[:shipping_cost_id]).to include("must be other than 0")
      end

      it '発送元の地域IDが0の場合、無効である' do
        article.prefecture_id = 0
        article.valid?
        expect(article.errors[:prefecture_id]).to include("must be other than 0")
      end

      it '発送までの日数IDが0の場合、無効である' do
        article.days_to_ship_id = 0
        article.valid?
        expect(article.errors[:days_to_ship_id]).to include("must be other than 0")
      end

      it '価格が設定されていない場合、無効である' do
        article.price = nil
        article.valid?
        expect(article.errors[:price]).to include("can't be blank")
      end

      it '価格が300未満の場合、無効である' do
        article.price = 299
        article.valid?
        expect(article.errors[:price]).to include("must be between 300 and 9,999,999")
      end

      it '価格が10,000,000以上の場合、無効である' do
        article.price = 10_000_000
        article.valid?
        expect(article.errors[:price]).to include("must be between 300 and 9,999,999")
      end

      it '価格が数値でない場合、無効である' do
        article.price = "three hundred"
        article.valid?
        expect(article.errors[:price]).to include("must be a half-width number")
      end
    end
  end
end