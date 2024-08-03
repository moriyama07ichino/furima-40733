class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  has_many :orders

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true

    # ActiveHashの関連付け
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :shipping_cost, class_name: "ShippingCost"
  

  def sold?
    self.orders.exists?
  end
end
