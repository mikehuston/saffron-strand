class AddAddiToEvents < ActiveRecord::Migration
  def change
    add_column :events, :addi, :interger
  end
end
