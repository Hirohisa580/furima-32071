class OrdersController < ApplicationController
  
  def index
    @item_order = ItemOrder.new
    @item = Item.find(params[:item_id])
  end
 
  def create
    item = Item.find(params[:item_id])
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      # Payjp.api_key = "sk_test_d061207199db7a05610959b1"
      Payjp::Charge.create(
        amount: item[:price], 
        card: order_params[:token], 
        currency: 'jpy'
      )
      @item_order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end
 
 
  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :item_id).merge(user_id: current_user.id, token: params[:token])
  end
 
end
