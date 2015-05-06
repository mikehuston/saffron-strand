require 'mandrill'

class Admin::EventsController < ApplicationController

	def index
		@eventsa = Event.where(status: 'new')
		@eventsb = Event.where(status: 'confirm')
		@eventsc = Event.where(status: 'final')
	end

	def email_body user
    "Hi! \n \t #{user.name}! Thank you for your order. Payment has been received and it has been finalised."
 	end

	def change
		@event = Event.find(params[:id])
		@user = @event.user
		@event.status = 'confirm'
		@event.save!
		@price = @event.head_count * @event.menu.budget_per_person
		mandrill = Mandrill::API.new ENV["MANDRILL_API_KEY"]
    	message = {  
     	:subject=> "Order Confirmation",  
     	:from_name=> "Saffron Strand",  
     	:html=> "<h3> Your order has been confirmed! Here is your invoice:</h3><br>
     	<h4><%= @event.event_type %><br>
     	<%= @event.menu.budget_per_person %> Per Person <br>
     	<%= @event.head_count %>  People<br>
     	<%= @price %> is your total cost!<br> Items:</h4> <br>
        <% @event.menu.items.each do |item| %>
        <%= item.name %> <br>
  		<% end %>",  
     	:to=>[  
       	{  
       	  :email=> @user.email,  
       	  :name=> @user.name 
       	}  
     	],    
     	:from_email=>"Saffron@saffronstrand.com"  
    	}  
    	sending = mandrill.messages.send message  
		redirect_to admin_events_path
	end

	def finalize
		@event = Event.find(params[:id])
    @user = @event.user
		@event.status = 'final'
		@event.save!
		mandrill = Mandrill::API.new ENV["MANDRILL_API_KEY"]
    	message = {  
     	:subject=> "Order Fianlized",  
     	:from_name=> "Saffron Strand",  
     	:html=> email_body(@user),  
     	:to=>[  
       	{  
       	  :email=> @user.email,  
       	  :name=> @user.name 
       	}  
     	],    
     	:from_email=>"Saffron@saffronstrand.com"  
    	}  
    	sending = mandrill.messages.send message 
		redirect_to admin_events_path
	end

	def show
		@event = Event.find(params[:id])
	end

end