class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index] #未ログインユーザーはログインページに移動
  before_action :item_params, only: [:index, :create]

  def index
    @user_order = UserOrder.new    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    if user_signed_in? && current_user.id == @item.user_id #ログインユーザーと出品者が同じ場合はトップページへ移行
     redirect_to root_path
    end
    if @item.order.present? #オーダーデータがあれば、トップページへ移行
      redirect_to root_path
    end
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render :index
    end 
  end

  private
  def item_params
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end


