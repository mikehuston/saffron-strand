class AddSampleToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :sample, :boolean
  end
end
