class OrderController < ApplicationController
  before_action :authenticate_user!,except: [:credit]
  before_action :itemf,expect: [:index,:create]
  def index
    @credit = Credit.new
    if (current_user == @item.user || @item.order != nil) 
       redirect_to root_path
    end
  end

  def create
    @credit = Credit.new(credit_params)
    
    if @credit.valid?
      @credit.save
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値
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
