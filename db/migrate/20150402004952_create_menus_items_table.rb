class CreateMenusItemsTable < ActiveRecord::Migration
  def up
  	create_table :menus_items, :id => false do |t|
  		t.references :menu
  		t.references :item
  	end
  	add_index :menus_items, [:menu_id, :item_id]
  	add_index :menus_items, :item_id
  end

  def down
  	drop_table :menus_items
  end
end
