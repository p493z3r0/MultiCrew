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

ActiveRecord::Schema.define(version: 2019_10_10_171140) do

  create_table "airports", force: :cascade do |t|
    t.string "IATA"
    t.string "ICAO"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dashboards", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "flights", force: :cascade do |t|
    t.string "from_airport", null: false
    t.string "to_airport", null: false
    t.integer "pic_pilot_id", null: false
    t.integer "cop_pilot_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "date"
    t.text "flightplan"
    t.text "description"
    t.string "aircraft"
    t.index ["cop_pilot_id"], name: "index_flights_on_cop_pilot_id"
    t.index ["pic_pilot_id"], name: "index_flights_on_pic_pilot_id"
  end

  create_table "friend_requests", force: :cascade do |t|
    t.integer "pilot_id", null: false
    t.integer "friend_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["friend_id"], name: "index_friend_requests_on_friend_id"
    t.index ["pilot_id"], name: "index_friend_requests_on_pilot_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "pilot_id"
    t.integer "friend_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pilots", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.decimal "hours"
    t.text "about"
    t.string "simulator"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "experience"
    t.index ["user_id"], name: "index_pilots_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "friend_requests", "friends"
  add_foreign_key "friend_requests", "pilots"
  add_foreign_key "pilots", "users"
end
