class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(id: :DESC)
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
    @items = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end  
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :explain, :category_id, :status_id, :delivery_charge_id, :area_id,:days_required_id, :price, :image ).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    @item = Item.find(params[:id])
     unless current_user == @item.user
      redirect_to root_path
     end

     if @item.order.present?
      redirect_to root_path
     end
  end
end
