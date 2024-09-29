class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # ニックネームが必須
  validates :nickname, presence: true

  # 名前(全角)が必須、全角（漢字・ひらがな・カタカナ）
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }

  # 名前カナ(全角)が必須、全角（カタカナ）
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }

  # 生年月日が必須
  validates :birthday, presence: true

  # パスワードが必須、6文字以上、半角英数字混合
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  # アソシエーション
  has_many :items, dependent: :destroy  # ユーザーが出品したアイテムの関連付け
  has_many :orders, dependent: :destroy # ユーザーが購入したオーダーの関連付け
end
