class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :sec_item, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end 

  def show
    @item = Item.find(params[:id])
  end

  def edit
    if @item.order != nil 
      redirect_to root_path
    end 
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end 
  end

  def destroy
     @item.destroy
     redirect_to root_path
  end

private
def item_params
  params.require(:item).permit(:image,:name,:explanation,:category_id,:state_id,:delivery_cost_id,:shipping_area_id,:shipping_days_id,:price).merge(user_id: current_user.id)

end


def set_item
  @item = Item.find(params[:id])
end

def sec_item
  unless current_user.id == @item.user_id
    redirect_to root_path
  end
end

end
