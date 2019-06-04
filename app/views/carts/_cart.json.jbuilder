json.extract! cart, :id, :orders, :created_at, :updated_at
json.url cart_url(cart, format: :json)
