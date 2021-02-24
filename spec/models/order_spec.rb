require 'rails_helper'

RSpec.describe Order, type: :model do

  describe "購入者登録" do
    before do
      item = FactoryBot.create(:item)
      @credit = FactoryBot.build(:credit,item_id: item.id)
      sleep 0.1
    end
    
    
    context '内容に問題ない場合' do
      it "正常確認" do
      expect(@credit).to be_valid
      end
    end

    context '内容に問題ある場合' do

      it "郵便番号がなければ登録できない" do
        @credit.post_num = ""
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Post num can't be blank")
      end

      it "郵便番号にはハイフンが必要である(ハイフンなしで入力)" do
        @credit.post_num = "0001111"
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Post num is invalid. Include hyphen(-)")
      end

      it "都道府県がなければ登録できない" do
        @credit.shipping_area_id = ""
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Shipping area can't be blank")
      end

      it "市町村がなければ登録できない" do
        @credit.municipalities = ""
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Municipalities can't be blank")
      end

      it "番地がなければ登録できない" do
        @credit.addresses = ""
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Addresses can't be blank")
      end

      it "電話番号がなければ登録できない" do
        @credit.tel = ""
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Tel can't be blank")
      end

      it "電話番号はハイフンが不要である" do
        @credit.tel = "090-1111-2222"
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Tel is invalid. Include hyphen(-)")
      end

      it "電話番号は11けた以内である(11けたより多くする)" do
        @credit.tel = "0901111222233"
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Tel is invalid. Include hyphen(-)")
      end






    end

  end

end
