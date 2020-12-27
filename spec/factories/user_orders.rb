FactoryBot.define do
  factory :user_order do
    postal_code             {"514-0817"}
    prefecture_id           {2}
    municipality            {"浜松市"}
    address                 {"小森町１−１"}
    phone_number            {123456789}
    token {"tok_abcdefghijk00000000000000000"}
  end
end

# バリデーションを記載しているモデルに対しての単体コードであるため、自身で本ファイルを作成する（rails gなど使用せず）
#ターミナルの確認は FactoryBot.build(:user_order)を使用する。createは保存であり、完璧な状態が必要であるが、アソシエーション化が図れていないなどあるためbuildを使用
# @user_order = FactoryBot(:user_order,item_id: 2, user_id: 1)