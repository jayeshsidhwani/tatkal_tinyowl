module RecommenderService
  class << self
    def recommend(user)
      recommendations = recommended_items(user)
      items_in_rooster = rooster_items(user)
      
      exact_matches = recommendations.where(:item_id => items_in_rooster).pluck(:item_id)
      more_items_to_fetch = 10 - exact_matches.length
      
      aux_matches = fetch_from_auxillary(items_in_rooster, more_items_to_fetch)
      exact_matches = exact_matches + aux_matches
      exact_matches
    end

    def rooster_items(user)
      Rooster.all.pluck(:item_id)
    end

    def recommended_items(user)
      UserPreference.where(user_id: user.id.to_s).order(rank: :desc)
    end

    def fetch_from_auxillary(items_in_rooster, more_items_to_fetch)
      AuxillaryPreference.where(first_item_id: items_in_rooster).order('rank desc').
      limit(more_items_to_fetch).
      pluck(:second_item_id)
    end
  end
end
