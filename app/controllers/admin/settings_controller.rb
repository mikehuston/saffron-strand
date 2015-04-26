class Admin::SettingsController < ApplicationController
  	before_filter :authorize_admin

	def index
	end
end
