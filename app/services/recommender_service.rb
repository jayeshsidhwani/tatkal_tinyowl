module RecommenderService
  class << self
    def recommend(user)
      recommendations = recommended_items(user)
      items_in_rooster = rooster_items(user)

      exact_matches = recommendations.where(:item_id => items_in_rooster).pluck(:item_id)
      more_items_to_fetch = 10 - exact_matches.length

      aux_matches = fetch_from_auxillary(recommendations, items_in_rooster, more_items_to_fetch)

      serialize({
                  exact: exact_matches,
                  aux_matches: aux_matches
      })
    end

    def rooster_items(user)
      Rooster.all.pluck(:item_id)
    end

    def recommended_items(user)
      UserPreference.where(user_id: user.id.to_s).order(rank: :desc)
    end

    def fetch_from_auxillary(recommendations, items_in_rooster, more_items_to_fetch)
      score = {}

      items_in_rooster.each do |item|
        max = 0
        recommendations.each do |recommend|
          rank = AuxillaryPreference.where(first_item_id: item, second_item_id: recommend.item_id).first.rank rescue 0
          rank = rank.to_i
          if rank >= max
            max = rank
          end
        end
        score[item] = max
      end
      
      score.sort_by {|k,v| v}.reverse
      max_length = [items_in_rooster.length, 10].min
      score.keys[0, max_length]
    end

    def serialize(data)
      result = {exact: [], aux: [] }
      data[:exact].each do |datum|
        item = Item.where(:item_id => datum).first
        result[:exact] << item
      end

      data[:aux_matches].each do |datum|
        item = Item.where(:item_id => datum).first
        result[:aux] << item
      end
      result
    end
  end
end
