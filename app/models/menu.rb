class Menu < ActiveRecord::Base
  attr_accessible :name, :budget_per_person
  # has_one :event
  has_and_belongs_to_many :items
  has_one :event
end