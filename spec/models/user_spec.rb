require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameが空では登録できない" do
      # nicknameが空では登録できないテストコードを記述します
      
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    
    it "emailが空では登録できない" do
      # emailが空では登録できないテストコードを記述します
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it "一意性" do
      user = FactoryBot.create(:user)
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    
    it "@" do
      
      @user.email = "kumakuma"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
      #binding.pry
    end

    it "パスワードが必須であること" do
      
      @user.password = ""
      @user.valid?
      #binding.pry
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
    end

    it "パスワードは６文字以上での入力が必須である(５文字以下はダメ)" do
     
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      #binding.pry
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードは半角英数混合が必要" do
     
      @user.password = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワードは確認を含めて２回入力すること" do
       
        @user.password = "000000"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
      
      it "パスワードとパスワード(確認用)の値の一致が必須" do
       
        @user.password = "000000"
        @user.password_confirmation = "111111"
        @user.valid?
        #binding.pry
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

  it "生年月日が必須" do
    
    @user.birth = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth can't be blank")
end





  




    
    
  end
end
