class AddFarmNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :farm_name, :string
  end
end
