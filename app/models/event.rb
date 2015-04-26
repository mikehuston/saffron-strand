class Event < ActiveRecord::Base
  attr_accessible :name, :head_count
  has_one :menu, :dependent => :destroy
  belongs_to :user

  def show
  	"/events/show"
  end

  def self.null_event
  	@@instance ||= Event.new
  	class << @@instance
  		def name
  			"You haven't created any events yet. Click here to begin making a customized menu for your event!"
  		end
  		def show
  			"/events/new"
  		end
  	end
  	@@instance
  end
end
