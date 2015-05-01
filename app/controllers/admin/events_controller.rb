class Admin::EventsController < ApplicationController

	def index
		@eventsa = Event.where(status: 'new')
		@eventsb = Event.where(status: 'confirm')
		@eventsc = Event.where(status: 'final')
	end

	def change
		@event = Event.find(params[:id])
		@event.status = 'confirm'
		@event.save!
		redirect_to admin_events_path
	end

	def finalize
		@event = Event.find(params[:id])
		@event.status = 'final'
		@event.save!
		redirect_to admin_events_path
	end

	def show
		@event = Event.find(params[:id])
	end

end