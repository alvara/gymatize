# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_13_105413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.text "how_to_use"
    t.string "brand"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gym_reviews", force: :cascade do |t|
    t.bigint "gym_id", null: false
    t.text "content"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gym_id"], name: "index_gym_reviews_on_gym_id"
  end

  create_table "gyms", force: :cascade do |t|
    t.string "name"
    t.string "vicinity"
    t.integer "location_lat"
    t.string "location_lng"
    t.string "integer"
    t.string "franchise"
    t.integer "rating"
    t.integer "user_ratings_total"
    t.string "google_place_id"
    t.string "business_status"
    t.float "sq_ft"
    t.integer "water_fountain"
    t.integer "floor_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "owned_equipments", force: :cascade do |t|
    t.bigint "gym_id", null: false
    t.bigint "equipment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["equipment_id"], name: "index_owned_equipments_on_equipment_id"
    t.index ["gym_id"], name: "index_owned_equipments_on_gym_id"
  end

  add_foreign_key "gym_reviews", "gyms"
  add_foreign_key "owned_equipments", "equipment"
  add_foreign_key "owned_equipments", "gyms"
end
