class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]  # new、create、edit、updateアクションに適用
  before_action :set_item, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    @items = Item.order(created_at: :desc) #すべてのアイテムを新しい順に表示
  end

  def new
    @item = Item.new
    set_select_data  # インスタンス変数を設定
  end

  def create
    @item = Item.new(item_params)  # フォームから送信されたデータで新しい商品を作成
    @item.user = current_user
    if @item.save
      redirect_to root_path  # トップページにリダイレクト
    else
      set_select_data
      render :new, status: :unprocessable_entity  # 保存が失敗したらnewテンプレートを再表示
    end
  end

  def show
  end

  def edit
  end

  def update    
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity  # 保存が失敗したらeditテンプレートを再表示
    end
  end


  private

  def item_params
    params.require(:item).permit(
      :name, 
      :description,
      :image,
      :category_id,
      :condition_id,
      :shipping_cost_id,
      :prefecture_id,
      :days_to_ship_id,
      :price
      ) # 既存のパラメータ名に:imageを追加
  end

  def set_select_data
    @categories = Category.all
    @conditions = Condition.all
    @shipping_costs = ShippingCost.all
    @prefectures = Prefecture.all
    @days_to_ship = DaysToShip.all
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def correct_user
    unless @item.user == current_user
      redirect_to root_path
    end
  end

end
