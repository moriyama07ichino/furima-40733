require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  describe '商品購入' do
    let(:purchase_form) { build(:purchase_form) }

    context '購入ができる場合' do
      it '全ての入力情報が適切であれば購入できること' do
        expect(purchase_form).to be_valid
      end
    end

    context '購入ができない場合' do
      it '必須項目が欠けていると購入できないこと' do
        purchase_form.postal_code = nil
        purchase_form.valid?
        expect(purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'エラーメッセージが適切に表示されること' do
        purchase_form.postal_code = nil
        purchase_form.valid?
        expect(purchase_form.errors.full_messages).to include("郵便番号が入力されていません")
      end
    end
  end
end