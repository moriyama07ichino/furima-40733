class ItemsController < ApplicationController
  def index  # indexアクションを定義した
    @item = "これはコントローラーで定義したインスタンス変数を確認するための文字列です"
  end
end
