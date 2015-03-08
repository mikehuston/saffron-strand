class ItemsController < ApplicationController

	def index
		@items = Item.all
	end

	def breakfast
		@items = Item.where(category: 'breakfast')
	end

	def lunch
		@items = Item.where(category: 'lunch')
	end

	def dinner
		@items = Item.where(category: 'dinner')
	end

end
