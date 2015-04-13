class Admin::MenusController < ApplicationController
  layout "admin_application"
  before_filter :authenticate_user!

  def new
  end

  def create
    # @menu = Menu.new
    if params[:items].nil?
      flash[:message] = "You must choose at least one item!"
      redirect_to new_admin_menu_path
    else 
      items = params[:items].select {|k,v| v == '1'}.map {|k,v| k}
      @menu = Menu.create(params[:menu])
      @menu.items = Item.find(items)
      redirect_to admin_menus_path
    end
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    if params[:items].nil?
      flash[:message] = "You must choose at least one item!"
      redirect_to edit_admin_menu_path(@menu) and return
    else 
      items = params[:items].select {|k,v| v == '1'}.map {|k,v| k}
      @menu.items = Item.find(items)
    end
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
