# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150530013910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auxillary_preferences", force: true do |t|
    t.string   "first_item_id"
    t.string   "second_item_id"
    t.string   "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "item_type"
    t.string   "restaurant_name"
    t.string   "base_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roosters", force: true do |t|
    t.string   "item_id"
    t.string   "number_of_orders"
    t.string   "ttl"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_preferences", force: true do |t|
    t.string   "user_id"
    t.string   "item_id"
    t.string   "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
