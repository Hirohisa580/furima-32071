class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit]


  def index
    @item = Item.order("id DESC")
    @user_item = UserItem.all
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

  def show 
    @user_item = UserItem.all
    @user_item_item_id = UserItem.select(:item_id)
    @user_item_user_id = UserItem.select(:user_id)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id != @item.user.id
      redirect_to item_path
    else
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :status_id, :shipping_id, :area_id, :days_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
      unless @item.user.id == current_user.id
        redirect_to root_path
      end
  end
end
