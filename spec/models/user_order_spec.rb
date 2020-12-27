require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user = FactoryBot.create(:user) #userのファクトリーボットを使用して、テスト用のデータを保存させる（実際にはテストを実施した後消える）
    @item = FactoryBot.create(:item) #itemのファクトリーボットを使用して、テスト用のデータを保存させる
    @user_order = FactoryBot.build(:user_order, user_id:@user.id, item_id:@item.id) #user_idはキーで空の状態なので、バリューである@user.idを記載することで、キーに入る。配列に入れる際は<<を使用し、ハッシュの際は:でやると導入される。実際の数値は入れない（実際登録させたものでないとテストはできないため）
    sleep(1) #上記でmysqlとやりとりしてる間にテストコードを読み取ってしまい、追いつかずエラー。そこで処理速度を緩める
  end
  
  describe '商品購入情報と購入者情報が保存する' do
    context "商品購入情報と購入情報が保存できる場合" do
      it "tokenとpostal_codeとprefecture_idとmunicipalityとaddressとphone_numberがあれば保存できる" do
        expect(@user_order).to be_valid
      end
      it "建物名が空でも購入できる" do
        @user_order.building_name = nil
        expect(@user_order).to be_valid
      end
    end

    context '登録がうまくいかないとき' do
      it "tokenが空では登録できないこと" do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空だと登録できない" do
        @user_order.postal_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank", "Postal code 郵便番号（「-」を含む且つ7桁）")
      end
      it "郵便番号で「-」がないと登録できない" do
        @user_order.postal_code = "1230000"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code 郵便番号（「-」を含む且つ7桁）")
      end
      it "郵便番号で6桁だと登録できない" do
        @user_order.postal_code = "123-000"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code 郵便番号（「-」を含む且つ7桁）")
      end
      it "都道府県が空だと登録できない" do
        @user_order.prefecture_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市区町村が空だと登録できない" do
        @user_order.municipality = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Municipality can't be blank", "Municipality 全角ひらがな、全角カタカナ、漢字")
      end
      it "都道府県選択で1を選択すると登録できない" do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "番地が空だと登録できない" do
        @user_order.address = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空だと登録できない" do
        @user_order.phone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank", "Phone number 半角数字")
      end
      it "電話番号が大文字だと登録できない" do
        @user_order.phone_number = "０９０２７７１０９８６"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number 半角数字")
      end
      it "user_idが空では登録できない" do
        @user_order.user_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できない" do
        @user_order.item_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end