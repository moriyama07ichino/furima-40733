class ItemsController < ApplicationController
  def index  # indexアクションを定義した
    @item = "これはコントローラーで定義したインスタンス変数を確認するための文字列です"
  end

  def item_params
    params.require(:item).permit(:name, :description, :image) # 既存のパラメータ名に:imageを追加
  end
end
