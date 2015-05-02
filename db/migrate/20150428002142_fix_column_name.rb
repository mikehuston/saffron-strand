class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :events, :name, :event_type
  end
end
