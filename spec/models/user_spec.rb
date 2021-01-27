require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題ない場合' do

    end

    context '内容に問題ある場合' do

    it "nicknameが空では登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it "一意性でない場合、登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    
    it "@がないと登録できない" do
      
      @user.email = "kumakuma"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "パスワードが全角だと登録できない" do
      @user.password = "ああああああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "パスワードが必須である ないと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
    end

    it "パスワードは６文字以上での入力が必須である(５文字以下だと登録できない)" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードは半角英数混合が必要,混合していないと登録できない" do
      @user.password = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワードは確認を含めて２回入力すること,入力していないと登録できない" do
        @user.password = "000000"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
      
      it "パスワードとパスワード(確認用)の値の一致が必須,一致していないと登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "ユーザー本名は名字と名前がそれぞれ必須である(lastname_kanjiが空)" do
      @user.lastname_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname kanji can't be blank")
  end

  it "ユーザー本名は名字と名前がそれぞれ必須である(firstname_kanjiが空)" do
    @user.firstname_kanji = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Firstname kanji can't be blank")
  end

it "ユーザー本名は漢字のみで入力させること(漢字以外で入力した場合、登録できない)" do    
  @user.lastname_kanji = "aaaaaa"
  @user.firstname_kanji = "cccccc"
  @user.valid?
  expect(@user.errors.full_messages).to include("Firstname kanji 全角漢字を使用してください", "Lastname kanji 全角漢字を使用してください")
end

it "ユーザー本名のフリガナは全角カタカナ(全角カタカナ以外で入力した場合、登録できない)" do
  
  @user.lastname_kana = "aaaaaa"
  @user.firstname_kana = "cccccc"
  @user.valid?
  expect(@user.errors.full_messages).to include("Firstname kana 全角カナを使用してください", "Lastname kana 全角カナを使用してください")
end



  it "生年月日が必須,ないと登録できない" do
    
    @user.birth = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth can't be blank")
    end  
  end
 end
end
