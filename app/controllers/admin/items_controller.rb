class Admin::ItemsController < ApplicationController
  layout "admin_application"
  before_filter :authenticate_user!


  def new
  end

  def create
    @item = Item.new(params[:item])
    if @item.valid?
      @item.save
      flash[:notice] = 'Item created'
      redirect_to admin_items_path
    else
      redirect_to new_admin_item_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find params[:id]
    @item.update_attributes!(params[:item])
    redirect_to admin_items_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
  end

  def index
    @items = Item.all
    @checked_categories = @all_categories = %w{Breakfast Lunch Dinner}
    if params[:category]
      @checked_categories = params[:category].keys
    end
    @items = Item.where(:category => @checked_categories)
  end

  def show 
    @item = Item.find(params[:id])
  end
end
