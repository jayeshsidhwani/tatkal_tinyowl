class CreateRoosters < ActiveRecord::Migration
  def change
    create_table :roosters do |t|
      t.string :item_id
      t.string :number_of_orders
      t.string :ttl

      t.timestamps
    end
  end
end
