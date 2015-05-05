class CreateMenuStructures < ActiveRecord::Migration
	def change
		create_table :menu_structures do |t|
			t.string :event_type
			t.integer :budget_per_person
			t.integer :num_appetizers, default: 0
			t.integer :num_sides, default: 0
			t.integer :num_entrees, default: 0
			t.integer :num_desserts, default: 0
			t.references :user
		end

		add_index :menu_structures, [:event_type, :budget_per_person], :unique => true
	end
end
