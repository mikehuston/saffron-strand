class WelcomeController < ApplicationController


  def index
  	if current_user != nil
  		if current_user.admin?
  			redirect_to admin_items_path
  		end
  	end
  end
end
 