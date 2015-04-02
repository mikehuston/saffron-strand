class Admin::MenusController < ApplicationController
  before_filter :authenticate_user!

  def new
  end

  def create
    @menu = Menu.new(params[:menu])
    if @menu.valid?
      @menu.save
      flash[:notice] = 'Item created'
      redirect_to admin_menus_path
    else
      redirect_to new_admin_menus_path
    end
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
