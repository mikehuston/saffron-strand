class FixPhoneColumns < ActiveRecord::Migration
  def change
  	change_column :events, :phone_availability, :time
  	rename_column :events, :phone_availability, :phone_availability_start
	add_column :events, :phone_availability_end, :time
  end
end
