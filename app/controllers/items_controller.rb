class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @item = Item.all.order(created_at: :desc)
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
    if @item.order.present? #買えなくする設定はコントローラーの方がやりやすい。
    redirect_to root_path
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
    @item.destroy
    redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :price, :comment, :category_id, :product_condition_id, :shipping_charge_id, :shipping_address_id, :estimated_shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
