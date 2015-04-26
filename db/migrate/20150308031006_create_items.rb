class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :desc
      t.decimal :price
      t.string :category

      t.timestamps
    end
  end
end
