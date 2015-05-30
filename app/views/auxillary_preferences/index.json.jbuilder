json.array!(@auxillary_preferences) do |auxillary_preference|
  json.extract! auxillary_preference, :id, :first_item_id, :second_item_id, :rank
  json.url auxillary_preference_url(auxillary_preference, format: :json)
end
