class AddSuburbToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :suburb, :string
  end
end
