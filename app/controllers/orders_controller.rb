class OrdersController < ApplicationController
  
  def index
    @user_order = UserOrder.new    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end

  def create
    @user_order = UserOrder.new(order_params)
    # binding.pry
    if @user_order.valid?
      @user_order.save
      redirect_to root_path
    else
      render :index
    end 
  end

  private
  
  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number)
  end
end


