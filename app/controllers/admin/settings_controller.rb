class Admin::SettingsController < ApplicationController

	def index
	  	unless current_user != nil && current_user.admin?
  			redirect_to new_user_session_path
	  	end
	end
end
