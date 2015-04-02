class Item < ActiveRecord::Base
  attr_accessible :category, :desc, :name, :price, :image, :food_type
  has_and_belongs_to_many :menus
  has_attached_file :image,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_visibility => 'public'
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/gif', 'image/png'] 
end
