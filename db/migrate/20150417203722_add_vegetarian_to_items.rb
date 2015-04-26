class AddVegetarianToItems < ActiveRecord::Migration
  def change
    add_column :items, :vegetarian, :boolean
  end
end
