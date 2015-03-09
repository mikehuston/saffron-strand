class Admin::ItemsController < ApplicationController
  def new
  end

  def create
    @item = Item.create!(params[:item])
    redirect_to admin_items_path
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
