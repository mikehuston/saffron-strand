class Category < ActiveRecord::Base
  attr_accessible :name
  belongs_to :item, :dependent => :destroy

  def self.names
    ['Cocktail Party', 'Brunch', 'Lunch', 'Dinner']
  end

end
