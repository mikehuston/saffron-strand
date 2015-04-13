class WelcomeController < ApplicationController

  layout :user_or_admin_layout


  private
    def user_or_admin_layout
      current_user.admin? ? "admin_application" : "application"
    end

  def index
  	if current_user != nil
  		if current_user.admin?
  			redirect_to admin_items_path
  		end
  	end
  end
end
 