class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.text :listing_title
      t.references :console, null: false, foreign_key: true
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
