class Item < ActiveRecord::Base
  attr_accessible :category, :desc, :name, :price, :image
  has_attached_file :avatar,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_visibility => 'public'
end
