class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]  # ログインが必要なアクションに適用
  
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])

    # 自分が出品した商品ならトップページにリダイレクト
    if @item.user_id == current_user.id || @item.sold?
      redirect_to root_path and return
    end

    @purchase_form = PurchaseForm.new
  end

  def create
    @item = Item.find(params[:item_id])

    # 売却済みかつ現在のユーザーが出品者ではない場合、トップページにリダイレクト
     if @item.user_id != current_user.id && @item.sold?
      redirect_to root_path and return
     end

    @purchase_form = PurchaseForm.new(order_params)

    # 保存処理
     if @purchase_form.valid?
        pay_item  # PAY.JPでの決済処理を呼び出す
        @purchase_form.save
        redirect_to root_path 
     else
        gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
        render :index, status: :unprocessable_entity # エラーメッセージを表示するためにindexテンプレートをレンダリング
     end
  end

  private

  # ストロングパラメーターを設定
  def order_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  # 決済処理を行うメソッド
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵

    Payjp::Charge.create(
      amount: @item.price,    # 商品の値段（amountの値を適宜修正）
      card: order_params[:token], # カードトークン
      currency: 'jpy'          # 通貨の種類（日本円）
    )
  end
end
