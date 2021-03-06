class UserOrder

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :token, :user_id, :item_id  # order.idとか入れないといけない。クレジット入れる（コントローラー案件）。使えるようにする。attr_accessorの意味は知りたい


    # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/	, message: "郵便番号（「-」を含む且つ7桁）"}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/	, message: "全角ひらがな、全角カタカナ、漢字"}
    validates :address
    validates :phone_number,format: { with: /\A[0-9]+\z/,with: /\A\d{10,11}\z/,message: "半角数字"}
    validates :token
    validates :user_id # フォームオブジェクトでは直接アソシエーションを組んでいないためにバリデーションが必要
    validates :item_id
  end

  # 各テーブルにデータを保存する処理を書く
  def save
   # 購入情報を保存する
   order = Order.create(user_id: user_id, item_id: item_id) #別途どこからきたんじゃuserなどがどこからきたんじゃ情報を入れる（orderコントローラー）
  # 発送先住所を保存する
   Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number)
  end
end

