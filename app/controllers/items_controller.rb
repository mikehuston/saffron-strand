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
		@items = Item.all.select {|e| e.categories.include? Category.find_by_name("Breakfast")}
	end

	def lunch
		@items = Item.all.select {|e| e.categories.include? Category.find_by_name("Lunch")}
	end

	def dinner
		@items = Item.all.select {|e| e.categories.include? Category.find_by_name("Dinner")}
	end

end
