json.array!(@user_preferences) do |user_preference|
  json.extract! user_preference, :id, :user_id, :item_id, :rank
  json.url user_preference_url(user_preference, format: :json)
end
