# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_24_202004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer "date"
    t.integer "start_hour"
    t.integer "end_hour"
    t.integer "number_of_hour"
    t.bigint "user_id", null: false
    t.bigint "tennis_court_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tennis_court_id"], name: "index_bookings_on_tennis_court_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "tennis_court_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tennis_court_id"], name: "index_reviews_on_tennis_court_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tennis_courts", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.integer "price_per_hour"
    t.text "detail"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tennis_courts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "role"
    t.string "first_name"
    t.string "last_name"
    t.text "address"
    t.integer "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bookings", "tennis_courts"
  add_foreign_key "bookings", "users"
  add_foreign_key "reviews", "tennis_courts"
  add_foreign_key "reviews", "users"
  add_foreign_key "tennis_courts", "users"
end
