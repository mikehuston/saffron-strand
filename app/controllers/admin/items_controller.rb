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
    @items = Item.all
  end

  def show 
    @item = Item.find(params[:id])
  end
end
