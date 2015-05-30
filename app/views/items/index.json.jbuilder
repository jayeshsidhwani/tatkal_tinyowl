json.array!(@items) do |item|
  json.extract! item, :id, :id, :name, :item_type, :restaurant_name, :base_price
  json.url item_url(item, format: :json)
end
