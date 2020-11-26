class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  
  def index
    @item_order = ItemOrder.new
    if current_user.id == @item.user_id || @item.user_item != nil # この式が購入済みである事を示しています。
      # 出品者が自分の出品した商品の購入ページに直接飛べなくなる実装を忘れていたので追加しました。user_signed_in?は削除しました。
      redirect_to root_path
    end
  end
 
  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render :index
    end
  end
 
 
  private

  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price], 
      card: order_params[:token], 
      currency: 'jpy'
    )
  end
 
end
