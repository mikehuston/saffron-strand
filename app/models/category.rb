class Category < ActiveRecord::Base
  attr_accessible :name
  has_one :item, :dependent => :destroy

  def self.names
    ['Cocktail Party', 'Brunch', 'Lunch', 'Dinner']
  end

end
