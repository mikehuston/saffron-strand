class AddPhoneAvailabilityToEvents < ActiveRecord::Migration
  def change
    add_column :events, :phone_availability, :string
  end
end
