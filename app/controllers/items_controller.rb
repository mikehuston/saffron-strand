class ItemsController < ApplicationController

	def index
		redirect_to items_breakfast_path
	end

	def show
		@item = Item.find(params[:id])
		if request.xhr?
			render(:partial => 'item', :object => @item) and return
		end
		redirect_to :back
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
