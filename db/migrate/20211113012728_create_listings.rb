class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: true
      t.text :listing_title
      t.references :console, null: false, foreign_key: true
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
