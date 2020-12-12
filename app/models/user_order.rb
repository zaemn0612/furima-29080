class UserOrder

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number

    # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/	, message: "郵便番号（「-」を含む且つ7桁）"}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/	, message: "全角ひらがな、全角カタカナ、漢字"}
    validates :address
    validates :phone_number,format: { with: /\A[0-9]+\z/	, message: "半角数字"}
  end

  # 各テーブルにデータを保存する処理を書く
  def save
  # 購入情報を保存する
　  Order.create(user_id: user_id, item_id: item_id)
  # 発送先住所を保存する
    Address.create(order_id: order_id, postal_code: postal_code, prefecture_id: prefecture_id,municipality: municipality,address: address,building_name: building_name,phone_number: phone_number)
  end
end
