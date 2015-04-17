class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :phone, :address, :admin, :key
  # attr_accessible :title, :body

  has_one :event

  def self.non_admin
    users = User.all
    users.reject { |e| e.admin? }
  end	

  def destroy_current_event
    if not event.nil?
      event.destroy
    end
  end

end
