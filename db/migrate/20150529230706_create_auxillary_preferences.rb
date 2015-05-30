class CreateAuxillaryPreferences < ActiveRecord::Migration
  def change
    create_table :auxillary_preferences do |t|
      t.string :first_item_id
      t.string :second_item_id
      t.string :rank

      t.timestamps
    end
  end
end
