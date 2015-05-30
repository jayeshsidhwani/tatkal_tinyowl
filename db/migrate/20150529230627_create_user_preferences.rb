class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.string :user_id
      t.string :item_id
      t.string :rank

      t.timestamps
    end
  end
end
