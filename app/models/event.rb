class Event < ActiveRecord::Base
  attr_accessible :event_type, :head_count
  has_one :menu, :dependent => :destroy
  belongs_to :user

<<<<<<< HEAD
=======
  def show
  	"/events/show"
  end

  def self.get_event_types
  	['Cocktail Party','Breakfast','Brunch','Lunch','Dinner']
  end

  def self.null_event
  	@@instance ||= Event.new
  	class << @@instance
  		def event_type
  			"You haven't created any events yet. Click here to begin making a customized menu for your event!"
  		end
  		def show
  			"/events/new"
  		end
  	end
  	@@instance
  end
>>>>>>> iter4
end
