class ItemsController < ApplicationController
  def index
    
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
    params.require(:item).permit(:product_name, :price, :comment, :category_id, :product_condition_id, :shipping_charges_id, :shipping_address_id, :estimated_shipping_date_id, :image).merge(user_id: current_user.id)
  end

end
