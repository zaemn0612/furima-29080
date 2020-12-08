class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]

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

  private
  def item_params
    params.require(:item).permit(:product_name, :price, :comment, :category_id, :product_condition_id, :shipping_charge_id, :shipping_address_id, :estimated_shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
