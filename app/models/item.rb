class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :name, :description, :image, :user, presence: true
  validates :price, presence: true, numericality: {
              only_integer: true,              
              greater_than_or_equal_to: 300,
              less_than_or_equal_to: 9_999_999
            }
  
  # ActiveHashの関連付け
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_cost, class_name: "ShippingCost"
  belongs_to_active_hash :category, class_name: "Category"
  belongs_to_active_hash :condition, class_name: "Condition"
  belongs_to_active_hash :prefecture, class_name: "Prefecture"
  belongs_to_active_hash :days_to_ship, class_name: "DaysToShip"

  # 各属性のバリデーション
  validates :shipping_cost_id, :category_id, :condition_id, :prefecture_id, :days_to_ship_id,
            numericality: { other_than: 1, message: "must be selected" }

  # 商品が売れているかどうかを確認するメソッド
  def sold?
    self.order.present?
  end
end