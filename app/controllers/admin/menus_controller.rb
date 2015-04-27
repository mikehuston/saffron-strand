class Admin::MenusController < ApplicationController
  # before_filter :authenticate_user!
  before_filter :authorize_admin

  def new
  end

  def create
    # @menu = Menu.new
    if params[:items].nil?
      flash[:message] = "You must choose at least one item!"
      redirect_to new_admin_menu_path
    else 
      items = params[:items].select {|k,v| v == '1'}.map {|k,v| k}
      @menu = Menu.new(params[:menu])
      @menu.sample = true
      @menu.save
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
  end

  def show 
    @menu = Menu.find(params[:id])
  end

end
