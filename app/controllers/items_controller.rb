class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  def index
    @item = Item.all.order("id DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :status_id, :shipping_id, :area_id, :days_id, :image).merge(user_id: current_user.id)
  end

end
