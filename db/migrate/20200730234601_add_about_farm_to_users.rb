class AddAboutFarmToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :about_farm, :text
  end
end
