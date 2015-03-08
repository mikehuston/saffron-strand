class ItemsController < ApplicationController

	def index
		@items = Item.all
		po = Item.create(name: 'pea', price: 3.4, category: 'breakfast')
		po = Item.create(name: 'ice', price: 6.4, category: 'breakfast')
		po = Item.create(name: 'rice', price: 3.6, category: 'lunch')
		po = Item.create(name: 'dri', price: 3.9, category: 'lunch')
		po = Item.create(name: 'pie', price: 2.4, category: 'dinner')
		po = Item.create(name: 'ham', price: 31.4, category: 'dinner')
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
