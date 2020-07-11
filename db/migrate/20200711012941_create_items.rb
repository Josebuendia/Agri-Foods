class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image_url
      t.string :shelf_life
      t.string :category
      t.string :county
      t.string :farm

      t.timestamps
    end
  end
end
