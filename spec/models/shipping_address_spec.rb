require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @order = FactoryBot.create(:order, user: @user, item: @item)
    @shipping_address = FactoryBot.build(:shipping_address, order: @order)
  end

  describe '配送先情報の保存' do
    context '内容に問題がない場合' do
      it '全ての項目が正しく入力されていれば保存できる' do
        expect(@shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空では保存できない' do
        @shipping_address.postal_code = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンが含まれていない場合は保存できない' do
        @shipping_address.postal_code = '1234567'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '都道府県が空では保存できない' do
        @shipping_address.prefecture_id = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では保存できない' do
        @shipping_address.city = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では保存できない' do
        @shipping_address.address = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では保存できない' do
        @shipping_address.phone_number = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が9桁以下では保存できない' do
        @shipping_address.phone_number = '090123456'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it '電話番号が12桁以上では保存できない' do
        @shipping_address.phone_number = '090123456789'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it '電話番号に数字以外が含まれている場合は保存できない' do
        @shipping_address.phone_number = '090-1234-5678'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
    end
  end
end