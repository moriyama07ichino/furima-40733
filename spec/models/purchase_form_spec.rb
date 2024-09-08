require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_form = PurchaseForm.new(
      token: 'tok_abcdefghijk00000000000000000',
      user_id: @user.id,
      item_id: @item.id,
      postal_code: '123-4567',
      prefecture_id: 2,
      city: '東京都',
      address: '青山1-1-1',
      building: 'ビル101',
      phone_number: '09012345678'
    )
  end

  describe '購入情報の保存' do
    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@purchase_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では保存できない' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空では保存できない' do
        @purchase_form.postal_code = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '都道府県が空では保存できない' do
        @purchase_form.prefecture_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では保存できない' do
        @purchase_form.city = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では保存できない' do
        @purchase_form.address = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では保存できない' do
        @purchase_form.phone_number = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'user_idが空では保存できない' do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では保存できない' do
        @purchase_form.item_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
      end

      it '郵便番号にハイフンが含まれていない場合、無効である' do
        @purchase_form.postal_code = '1234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '電話番号が9桁以下の場合、無効である' do
        @purchase_form.phone_number = '090123456'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it '電話番号が12桁以上の場合、無効である' do
        @purchase_form.phone_number = '090123456789'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it '電話番号に数字以外が含まれている場合、無効である' do
        @purchase_form.phone_number = '090-1234-5678'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
    end
  end
end