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
  end
end
