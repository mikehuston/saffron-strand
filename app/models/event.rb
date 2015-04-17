class Event < ActiveRecord::Base
  attr_accessible :name, :head_count
  has_one :menu, :dependent => :destroy
  belongs_to :user
  def menu_budget
  	menu.budget_per_person
  end

end
