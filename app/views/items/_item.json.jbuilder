json.extract! item, :id, :title, :description, :price, :image_url, :shelf_life, :category, :county, :farm, :created_at, :updated_at
json.url item_url(item, format: :json)
