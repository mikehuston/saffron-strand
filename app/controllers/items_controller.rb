class ItemsController < ApplicationController
  	layout :user_or_admin_layout


  	private
      def user_or_admin_layout
      	puts("________________________________________")
      	puts(current_user.admin?) #WTF WHY IS THIS RETURNING FALSE
      	current_user.admin? ? "admin_application" : "application"
      end

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
