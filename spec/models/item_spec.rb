require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品を保存する' do
    context "商品が保存できる場合" do
      it "product_nameとcommentとcategory_idとpriceとproduct_condition_idとshipping_charges_idとshipping_address_idとestimated_shipping_date_idと画像があれば保存できる" do
        expect(@item).to be_valid
      end
    end
    context "商品が保存できない場合" do
      it "商品名がないと保存出来ない" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end     
      it "商品の説明がないと保存できない" do
        @item.comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end     
      it "カテゴリ情報がないと保存できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it "カテゴリ情報で「1」を選択すると保存できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態情報がないと保存できない" do
        @item.product_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank", "Product condition is not a number")
      end
      it "商品の状態情報で「1」を選択すると保存できない" do
        @item.product_condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition must be other than 1")
      end
      it "発送料の負担情報がないと保存できない" do
        @item.shipping_charges_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank", "Shipping charges is not a number")
      end
      it "発送料の負担情報で「1」を選択すると保存できない" do
        @item.shipping_charges_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
      end
      it "発送元の地域情報がないと保存できない" do
        @item.shipping_address_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping address can't be blank", "Shipping address is not a number")
      end
      it "発送元の地域情報で「1」を選択すると保存できない" do
        @item.shipping_address_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping address must be other than 1")
      end
      it "発送元までの日数情報がないと保存できない" do
        @item.estimated_shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping date can't be blank", "Estimated shipping date is not a number")
      end
      it "発送元までの日数情報で「1」を選択すると保存できない" do
        @item.estimated_shipping_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping date must be other than 1")
      end
      it "価格情報がないと保存できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price 半角英数字", "Price can't be blank", "Price is not a number")
      end
      it "価格情報が半角数字でないと保存できない" do
        @item.price = '３５０'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角英数字", "Price is not a number")
      end
      it "価格情報が300円より少ない範囲は保存できない" do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格情報が10000000円より多い範囲は保存できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "ユーザーが紐付いていないと商品は保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end