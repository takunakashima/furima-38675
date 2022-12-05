class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end
  
  def new
    @items = Item.new 
    @categories = Category.all
    @statuses = Status.all
    @delivery_chargies = Delivery_charge.all
    @areas = Area.all
    @days_requireds = Days_required.all

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
    # <%.merge(user_id: current_user.id)%>
  end

end
