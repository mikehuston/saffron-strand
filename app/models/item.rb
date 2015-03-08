class Item < ActiveRecord::Base
  attr_accessible :category, :desc, :name, :price
end
