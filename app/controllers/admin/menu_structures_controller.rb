class Admin::MenuStructuresController < ApplicationController

  	before_filter :authorize_admin

	def index
		@menu_structures = MenuStructure.all
	end

	def new
  	end

	def create
  		@menu_structure = MenuStructure.create(params[:menu_structure])	
  		redirect_to admin_menu_structures_path
	end

	def edit
		@menu_structure = MenuStructure.find(params[:id])
	end

	def update
		@menu_structure = MenuStructure.find(params[:id])
		@menu_structure.update_attributes!(params[:menu_structure])
		redirect_to admin_menu_structures_path
	end

	def destroy
		@menu_structure = MenuStructure.find(params[:id])
		@menu_structure.destroy
		redirect_to admin_menu_structures_path
	end

	def show
		@menu_structure = MenuStructure.find(params[:id])
	end
end 