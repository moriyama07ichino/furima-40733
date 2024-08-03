class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :days_to_ship

  has_one_attached :image

  validates :image, presence: true #商品画像を1枚つけることが必須であること
  validates :name, presence: true  #商品名が必須であること
  validates :description, presence: true #商品の説明が必須であること
  validates :category_id, numericality: { other_than: 0 }, presence: true #カテゴリーの情報が必須であること
  validates :condition_id, numericality: { other_than: 0 }, presence: true #商品の状態の情報が必須であること
  validates :shipping_cost_id, numericality: { other_than: 0 }, presence: true #配送料の負担の情報が必須であること
  validates :prefecture_id, numericality: { other_than: 0 }, presence: true #発送元の地域の情報が必須であること
  validates :days_to_ship_id, numericality: { other_than: 0 }, presence: true #発送までの日数の情報が必須であること
  validates :price, presence: true #価格の情報が必須であること
  validates :price, numericality: { only_integer: true, message: "must be a half-width number" } #価格は、¥300~¥9,999,999の間のみ保存可能であること
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "must be between 300 and 9,999,999" } #価格は半角数値のみ保存可能であること


end