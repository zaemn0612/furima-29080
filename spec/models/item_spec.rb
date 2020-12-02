require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品を保存する' do
    context "商品が保存できる場合" do
      it "product_nameとcommentとcategory_idとpriceとproduct_condition_idとshipping_charges_idとshipping_address_idとestimated_shipping_date_idと画像があれば保存できる" do
      end
    end
    context "商品が保存できない場合" do
      it "商品画像がないと保存出来ない" do
      end  
      it "商品名がないと保存出来ない" do
      end     
      it "商品の説明がないと保存できない" do
      end
      it "カテゴリ情報がないと保存できない" do
      end
      it "配送料の負担情報がないと保存できない" do
      end
      it "発送元の地域情報がないと保存できない" do
      end
      it "発送元の情報がないと保存できない" do
      end
      it "価格情報がないと保存できない" do
      end
      it "価格情報が半角数字でないと保存できない" do
      end
      it "価格情報が300円〜9999999円の範囲でないと保存できない" do
      end
      it "ユーザーが紐付いていないと商品は保存できない" do
      end
    end
  end
end