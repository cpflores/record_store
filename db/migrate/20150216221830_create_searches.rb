class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :name
      t.string :artist
      t.integer :year
      t.text :description
      t.integer :min_price
      t.integer :max_price

      t.timestamps null: false
    end
  end
end
