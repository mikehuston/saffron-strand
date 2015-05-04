class Category < ActiveRecord::Base
  attr_accessible :name
  has_one :item, :dependent => :destroy
end
