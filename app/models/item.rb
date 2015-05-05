class Item < ActiveRecord::Base
  attr_accessible :category, :desc, :name, :price, :image, :food_type, :vegetarian
  has_many :categories
  has_and_belongs_to_many :menus
  has_attached_file :image,
    :storage => :dropbox,
    :dropbox_credentials => {app_key: ENV['dropbox_app_key'],
    	app_secret: ENV['dropbox_app_secret'],
    	access_token: ENV['dropbox_access_token'],
    	access_token_secret: ENV['dropbox_access_token_secret'],
    	user_id: ENV['dropbox_user_id'],
    	access_type: ENV['dropbox_access_type']},
    :dropbox_visibility => 'public'
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/gif', 'image/png'] 

  def has_image?
    image and (image.url != '/images/original/missing.png')
  end
  
end
