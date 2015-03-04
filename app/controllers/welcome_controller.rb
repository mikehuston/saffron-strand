class WelcomeController < ApplicationController
  def index
  	@admin = current_user.admin
  end
end
 