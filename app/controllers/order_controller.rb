class OrderController < ApplicationController
  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @credit = Credit.new
    @item = Item.new(params[:id])
    @address = Address.new
  end
#購入ページで商品情報を表示する
#購入ページのhogeを修正する
#binding.pryをかけて住所情報が送れているかかくにんする
  def create
    @credit = Credit.new(credit_params)
    @item = Item.find(params[:item_id])
    
    if @credit.valid?
      #binding.pry
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
      #render item_order_index
      render :index
    end
  end

  private
def credit_params

  #params.permit(:post_num,:shipping_area_id,:municipalities,:addresses,:building,:tel,:item_id).merge(user_id: current_user.id)
  #params.permit(:number,:exp_month,:exp_year,:cvc,:post_num,:shipping_area_id,:municipalities,:addresses,:building,:tel,:item_id).merge(user_id: current_user.id)
  params.permit(:post_num,:shipping_area_id,:municipalities,:addresses,:building,:tel,:item_id,:token).merge(user_id: current_user.id,token: params[:token])
end

end
