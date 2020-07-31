class AddFarmersPictureToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :farmers_picture, :string
  end
end
