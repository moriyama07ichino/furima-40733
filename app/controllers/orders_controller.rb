class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new(order_params)
 
    # 保存処理
     if @purchase_form.valid?
        @purchase_form.save
        redirect_to root_path
     else
        render :index
     end
  end

  private

  def order_params
    params.require(:purchase_form).permit(:token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
