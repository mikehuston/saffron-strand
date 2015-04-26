class AddFoodTypeToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.string :food_type
    end
  end
end