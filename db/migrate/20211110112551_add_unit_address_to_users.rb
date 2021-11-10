class AddUnitAddressToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :unit_address, :string, null: false
  end
end
