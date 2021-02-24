class OrderController < ApplicationController
  before_action :authenticate_user!,except: [:credit]
  before_action :itemf,expect: [:index,:create]
  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @credit = Credit.new
    if current_user == @item.user
       redirect_to root_path
    end
    @address = Address.new
  end
#購入ページで商品情報を表示する
#購入ページのhogeを修正する
#binding.pryをかけて住所情報が送れているかかくにんする
  def create
    @credit = Credit.new(credit_params)
    
    if @credit.valid?
      @credit.save
      credit_params
      Payjp.api_key = "sk_test_e4ccce0316fd10e5bf8e6f23"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: credit_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      redirect_to root_path
    else
      render :index
    end
  end

  private
def credit_params
  params.permit(:post_num,:shipping_area_id,:municipalities,:addresses,:building,:tel,:item_id,:token).merge(user_id: current_user.id,token: params[:token])
end

def itemf
  @item = Item.find(params[:item_id])
end


end
