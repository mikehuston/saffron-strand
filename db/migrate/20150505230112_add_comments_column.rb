class AddCommentsColumn < ActiveRecord::Migration
  def change
  	add_column :events, :comments, :string
  end
end
