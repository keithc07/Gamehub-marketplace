class CreateBuys < ActiveRecord::Migration[6.1]
  def change
    create_table :buys do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.date :buy_date

      t.timestamps
    end
  end
end
