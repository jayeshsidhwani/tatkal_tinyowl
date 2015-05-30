namespace :ingest do
  require 'csv'

  task :auxillary_preferences => :environment do
    path = Rails.root.join('lib/tmp/auxillary_preferences.csv')
    aux = CSV.read(path)
    aux.each do |au|
      AuxillaryPreference.create(first_item_id: au[0],
                                 second_item_id: au[1],
                                 rank: au[2])
    end
  end

  task :populate_user_ids => :environment do
    path = Rails.root.join('lib/tmp/user_preferences.csv')
    user_ids = CSV.read(path)
    all_user_ids = user_ids.each {|au| au[0]}
    all_user_ids.uniq!

    all_user_ids.each do |u|
      User.create(id: u)
    end
  end

  task :user_preferences => :environment do
    path = Rails.root.join('lib/tmp/user_preferences.csv')
    prefs = CSV.read(path)

    prefs.each do |prefs|
      UserPreference.create(user_id: prefs[0],
                            item_id: prefs[1],
                            rank: (prefs[2].to_f*100))
    end
  end

  task :item_details => :environment do
    path = Rails.root.join('lib/tmp/item_details.csv')
    prefs = CSV.read(path)

    prefs.each do |pref|
      Item.create(item_id: pref[0],
                  name: pref[1],
                  item_type: pref[2],
                  restaurant_name: pref[3],
                  base_price: pref[4].to_s)
    end
  end

  task :setup => [:auxillary_preferences, :user_preferences, :item_details, :populate_user_ids]

end
