class OrdersController < ApplicationController
  
  def index
    @user_order = UserOrder.new    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @item = Item.find(params[:item_id]) #コントローラーに記載されていなければ、ヴューに反映されない。ネストしたときはidだけじゃNG。ネストのお作法
  end

  def create
    @item = Item.find(params[:item_id])#indexの情報に@itemの情報が有る限り、createする際は@itemの情報が必要（紐づけるために）
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
    params.require(:user_order).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end
end


