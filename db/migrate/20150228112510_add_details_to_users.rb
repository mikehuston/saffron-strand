class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :decimal
    add_column :users, :address, :text
    add_column :users, :admin, :boolean
    add_column :users, :key, :string
  end
end
