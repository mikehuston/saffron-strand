class EventsController < ApplicationController
  def create
  	budget_per_person = params[:event][:budget_per_person]
  	@event = Event.new(name: params[:event][:name], head_count: params[:event][:head_count])
  	if @event.valid?
      @event.save
      @event.create_menu name: 'Default Name', budget_per_person: budget_per_person
      redirect_to event_path(@event)
  	end
  end

  def new
  end

  def edit
  end

  def show
  	@event = Event.find(params[:id])
  end
end
