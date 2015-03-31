class Item < ActiveRecord::Base
  attr_accessible :category, :desc, :name, :price, :image, :type
  has_attached_file :image,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_visibility => 'public'
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/gif', 'image/png'] 
end
