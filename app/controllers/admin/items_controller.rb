class Admin::ItemsController < ApplicationController
  # before_filter :authenticate_user!
  # before_filter :authorize_admin

  def new
  end

  def create
    item = Item.new(params[:item])
    item_categories = params[:categories].select {|k,v| v == '1'}.map {|k,v| k}
    item.categories = item_categories.map {|category| Category.create(:name => category)}
    if item.valid?
      item.save
      flash[:notice] = 'Item created'
      redirect_to admin_items_path
    else
      redirect_to new_admin_item_path
    end
  end

  def edit
    @item = Item.find(params[:id])
    @selected = @item.categories.map {|c| c.name}
  end

  def update
    @item = Item.find params[:id]
    @item.update_attributes!(params[:item])
    item_categories = params[:categories].select {|k,v| v == '1'}.map {|k,v| k}
    @item.categories = item_categories.map {|category| Category.create(:name => category)}
    redirect_to admin_items_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
  end

  def index
    @items = Item.all
    @checked_categories = @all_categories = Category.names
    @checked_food_types = @all_food_types = %w{Appetizer Entree Sides Dessert}
    # if params[:category]
    #   @checked_categories = params[:category].keys
    # end
    # if params[:food_type]
    #   @checked_food_types = params[:food_type].keys
    # end
    @items = Item.where(:food_type => @checked_food_types)
  end

  def show 
    @item = Item.find(params[:id])
  end
end
