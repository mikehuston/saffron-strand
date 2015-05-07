class ItemsController < ApplicationController

	def index
		redirect_to items_brunch_path
	end

	def show
		@item = Item.find(params[:id])
		if request.xhr?
			render(:partial => 'item', :object => @item) and return
		end
		redirect_to :back
	end

	def brunch
		@items = Item.all.select {|e| e.categories_names.include? "Brunch"}
	end

	def lunch
		@items = Item.all.select {|e| e.categories_names.include? "Lunch"}
	end

	def dinner
		@items = Item.all.select {|e| e.categories_names.include? "Dinner"}
	end

end
