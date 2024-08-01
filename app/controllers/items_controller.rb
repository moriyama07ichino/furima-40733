class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]  # newとcreateアクションに適用

  def index  # indexアクションを定義した
    @item = "これはコントローラーで定義したインスタンス変数を確認するための文字列です"
  end

  def new
    @item = Item.new  # 新しい商品のための空のインスタンスを作成
  end

  def create
    @item = Item.new(item_params)  # フォームから送信されたデータで新しい商品を作成
    if @item.save
      redirect_to @item  # 保存が成功したら詳細ページにリダイレクト
    else
      render :new  # 保存が失敗したらnewテンプレートを再表示
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image) # 既存のパラメータ名に:imageを追加
  end
end
