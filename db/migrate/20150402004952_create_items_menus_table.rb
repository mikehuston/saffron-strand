class CreateItemsMenusTable < ActiveRecord::Migration
  def up
  	create_table :items_menus, :id => false do |t|
  		t.references :menu
  		t.references :item
  	end
  	add_index :items_menus, [:menu_id, :item_id]
  	add_index :items_menus, :item_id
  end

  def down
  	drop_table :items_menus
  end
end
