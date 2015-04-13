class MenusController < ApplicationController
  layout :user_or_admin_layout


  private
    def user_or_admin_layout
      current_user.admin? ? "admin_application" : "application"
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
