require 'rails_helper'

RSpec.describe Item, type: :model do
  
  describe "item登録" do
    before do
      @item = FactoryBot.build(:item)
  end

    context '内容に問題ない場合' do
      it "正常確認" do
       expect(@item).to be_valid
      end
    end

    context '内容に問題ある場合' do

      it "画像がなければ投稿できない" do
        @item.image = nil
        @item.valid?
        #binding.pry
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが空では登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      
      it "商品の説明(explanation)が空では登録できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      
      it "カテゴリー(category_id)が空では登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "カテゴリー(category_id)が--では登録できない" do
        @item.category_id = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end

      it "商品の状態(state_id)が空では登録できない" do
        @item.state_id  = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end

      it "商品の状態(state_id)が--では登録できない" do
        @item.state_id  = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("State is not a number")
      end

      it "配送料の負担(delivery_cost_id)が空では登録できない" do
        @item.delivery_cost_id  = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery cost can't be blank")
      end

      it "配送料の負担(delivery_cost_id)が--では登録できない" do
        @item.delivery_cost_id  = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery cost is not a number")
      end

      it "発送先の地域(shipping_are_id)が空では登録できない" do
        @item.shipping_are_id  = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping are can't be blank")
      end

      it "発送先の地域(shipping_are_id)が--では登録できない" do
        @item.shipping_are_id  = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping are is not a number")
      end

      it "発送までの日数(shipping_days_id)が空では登録できない" do
        @item.shipping_days_id  = ""
        @item.valid?

        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
      end

      it "発送までの日数(shipping_days_id)が--では登録できない" do
        @item.shipping_days_id  = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days is not a number")
      end

      it "価格(price)が空では登録できない" do
        @item.price  = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "価格の範囲が¥300~¥9999999の間であること" do
        @item.price  = 200
        @item.valid?
        #binding.pry
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
  end
end
end
