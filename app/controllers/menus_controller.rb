class MenusController < ApplicationController

  def structure
    @budgetpp = params[:budgetpp].to_i
    @item_types = Menu.get_item_types @budgetpp
    @item_counts = Menu.get_item_counts @budgetpp
    render(:partial => 'menu_structure', :locals => {budgetpp: @budgetpp, item_types: @item_types, item_counts: @item_counts})
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end

  def show 
  end

  def sample_menus
    @sample_menus = Menu.sample_menus
  end

end
