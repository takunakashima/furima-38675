class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
  end
  
  def new
    @items = Item.new    
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end  
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :explain, :category_id, :status_id, :delivery_charge_id, :area_id,:days_required_id, :price, :image ).merge(user_id: current_user.id)
  end

end
