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

ActiveRecord::Schema.define(version: 2022_07_14_214025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.text "do_description", null: false
    t.text "stay_description", null: false
    t.text "eat_description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longtitude"
    t.index ["name"], name: "index_cities_on_name", unique: true
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false
    t.integer "city_id", null: false
    t.text "description"
    t.string "price_range"
    t.string "cuisines"
    t.string "special_diets"
    t.string "meals"
    t.string "phonenum"
    t.string "res_address"
    t.float "longtitude", null: false
    t.float "latitude", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_restaurants_on_name", unique: true
  end

  create_table "spots", force: :cascade do |t|
    t.integer "city_id", null: false
    t.string "name", null: false
    t.string "spot_type", null: false
    t.text "description", null: false
    t.string "duration", null: false
    t.float "longtitude", null: false
    t.float "latitude", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_spots_on_city_id"
    t.index ["name"], name: "index_spots_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
