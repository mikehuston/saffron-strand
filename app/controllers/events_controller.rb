class EventsController < ApplicationController

  before_filter :authenticate_user!

  def create
  	budget_per_person = params[:event].delete :budget_per_person
    if not current_user.event.nil?
      current_user.event.destroy
    end
  	@event = Event.new(params[:event])
  	if @event.valid?
      @event.save
      @event.create_menu name: 'Default Name', budget_per_person: budget_per_person
      current_user.event = @event
      redirect_to '/events/custom_order'
  	end
  end

  def new
  end

  def edit
  end

  def custom_order
  	# @event = Event.find(params[:id])
  end
end
