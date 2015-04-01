class Event < ActiveRecord::Base
  attr_accessible :name, :head_count
  has_one :menu
  def menu_budget
  	menu.budget_per_person
  end

end
