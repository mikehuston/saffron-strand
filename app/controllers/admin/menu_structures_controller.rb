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
  		@menu_structure.event_type = params[:event_type]
  		@menu_structure.budget_per_person = params[:budget_per_person].to_i
  		@menu_structure.num_appetizers = params[:num_appetizers].to_i
  		@menu_structure.num_sides = params[:num_sides].to_i
  		@menu_structure.num_desserts = params[:num_desserts].to_i
  		@menu_structure.num_entrees = params[:num_entrees].to_i
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
