class PurchaseForm
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  validates :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :phone_number, presence: true
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' }

  def save
    ActiveRecord::Base.transaction do
      # Ordersテーブルに購入情報を保存
      order = Order.create(user_id: user_id, item_id: item_id)

      # ShippingAddressesテーブルに発送先情報を保存
      ShippingAddress.create(
        order_id: order.id,
        postal_code: postal_code,
        prefecture_id: prefecture_id,
        city: city,
        address: address,
        building: building,
        phone_number: phone_number
      )
    end
  end
end
