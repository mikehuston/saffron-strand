class WelcomeController < ApplicationController
  def index
  	if current_user != nil
  		@admin = current_user.admin
  		if @admin
  			redirect_to admin_items_path
  		end
  	end
  end
end
 