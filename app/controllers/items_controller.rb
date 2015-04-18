class ItemsController < ApplicationController
    before_action current_user.admin? ? session[:admin_view] = true : session[:admin_view] = false

	def index
		@items = Item.all
	end

	def breakfast
		@items = Item.where(category: 'Breakfast')
	end

	def lunch
		@items = Item.where(category: 'Lunch')
	end

	def dinner
		@items = Item.where(category: 'Dinner')
	end

end
