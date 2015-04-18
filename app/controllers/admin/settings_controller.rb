class Admin::SettingsController < ApplicationController

	def index
	  	if current_user != nil
	  		unless current_user.admin?
	  			redirect_to new_user_session_path
	  		end
	  	end
	end
end
