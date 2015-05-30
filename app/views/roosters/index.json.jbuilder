json.array!(@roosters) do |rooster|
  json.extract! rooster, :id, :item_id, :number_of_orders, :ttl
  json.url rooster_url(rooster, format: :json)
end
