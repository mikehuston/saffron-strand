class WelcomeController < ApplicationController
  def index
  	@admin = current_user.admin
  	redirect_to admin_items_path
  end
end
 