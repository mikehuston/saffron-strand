class CreateMenus < ActiveRecord::Migration
	def change
		create_table :menus do |t|
			t.string :name
			t.integer :budget_per_person
			t.references :event
		end
	end
end
