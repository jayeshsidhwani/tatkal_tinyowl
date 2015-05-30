namespace :ingest do
  require 'csv'

  task :auxillary_preferences => :environment do
    aux = CSV.read('/Users/jayesh/Downloads/auxillary_preferences.csv')
    aux.each do |au|
      AuxillaryPreference.create(first_item_id: au[0],
                                 second_item_id: au[1],
                                 rank: au[2])
    end
  end

  task :populate_user_ids => :environment do
    user_ids = CSV.read('/Users/jayesh/Downloads/user_preferences.csv')
    all_user_ids = user_ids.each {|au| au[0]}
    all_user_ids.uniq!

    all_user_ids.each do |u|
      User.create(id: u)
    end
  end
end
