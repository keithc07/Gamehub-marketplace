class CreateBuys < ActiveRecord::Migration[6.1]
  def change
    create_table :buys do |t|
      # t.references :post, null: false, foreign_key: true
      t.string :buy_date
      t.string :date

      t.timestamps
    end
  end
end
