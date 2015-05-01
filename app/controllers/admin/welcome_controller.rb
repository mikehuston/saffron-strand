class Admin::WelcomeController < ApplicationController
  	before_filter :authorize_admin

	def index
	end


end
