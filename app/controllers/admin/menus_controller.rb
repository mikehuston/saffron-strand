class Admin::MenusController < ApplicationController
  # before_filter :authenticate_user!

  def new
  end

  def create
    # @menu = Menu.new
    items = params[:items].select {|k,v| v == '1'}.map {|k,v| k}
    @menu = Menu.create(params[:menu])
    items.each do |item|
      @menu.items << Item.find(item)
    end
    redirect_to admin_menus_path
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find params[:id]
    @menu.update_attributes!(params[:menu])
    redirect_to admin_menus_path
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to admin_menus_path
  end

  def index
    @menus = Menu.all
    # @checked_categories = @all_categories = %w{Breakfast Lunch Dinner}
    # if params[:category]
    #   @checked_categories = params[:category].keys
    # end
    # @items = Item.where(:category => @checked_categories)
  end

  def show 
    @menu = Menu.find(params[:id])
  end
end
