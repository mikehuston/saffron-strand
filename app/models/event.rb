class Event < ActiveRecord::Base
  attr_accessible :name, :head_count
  has_one :menu, :dependent => :destroy
  belongs_to :user

end
