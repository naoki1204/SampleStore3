json.extract! product, :id, :number, :name, :unit_price, :image, :description, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
