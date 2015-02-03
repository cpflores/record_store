class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :name
      t.string :artist
      t.integer :year
      t.text :description
      t.integer :price
      t.boolean :availability, default: true

      t.timestamps null: false
    end
  end
end
