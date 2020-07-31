class AddFarmTypeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :farm_type, :string
  end
end
