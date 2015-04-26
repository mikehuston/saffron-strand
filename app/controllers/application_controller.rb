class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
  before_filter :authorize_admin

  def authorize_admin
  	if controller_path =~ /admin/
	    authenticate_user!
    	redirect_to(root_path) unless current_user.admin?
    end
  end
   
end