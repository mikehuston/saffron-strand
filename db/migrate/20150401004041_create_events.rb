class CreateEvents < ActiveRecord::Migration
	def change
		create_table :events do |t|
			t.string :name
			t.integer :head_count
			t.references :user
		end
	end
end
