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

ActiveRecord::Schema.define(version: 20160611182318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.integer  "state_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "fuels", force: :cascade do |t|
    t.date     "date"
    t.decimal  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "travel_id"
    t.string   "image"
    t.decimal  "odometer"
  end

  add_index "fuels", ["travel_id"], name: "index_fuels_on_travel_id", using: :btree

  create_table "lodgings", force: :cascade do |t|
    t.date     "date"
    t.string   "hotelName"
    t.string   "hotelPhone"
    t.decimal  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "travel_id"
    t.string   "image"
  end

  add_index "lodgings", ["travel_id"], name: "index_lodgings_on_travel_id", using: :btree

  create_table "meals", force: :cascade do |t|
    t.date     "date"
    t.string   "kind"
    t.decimal  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "travel_id"
    t.string   "image"
  end

  add_index "meals", ["travel_id"], name: "index_meals_on_travel_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "uf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "toll_booths", force: :cascade do |t|
    t.date     "date"
    t.decimal  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "travel_id"
    t.string   "image"
  end

  add_index "toll_booths", ["travel_id"], name: "index_toll_booths_on_travel_id", using: :btree

  create_table "travels", force: :cascade do |t|
    t.integer  "city_id"
    t.date     "initialDate"
    t.date     "finalDate"
    t.string   "description"
    t.integer  "vehicle_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "user"
  end

  add_index "travels", ["city_id"], name: "index_travels_on_city_id", using: :btree
  add_index "travels", ["user_id"], name: "index_travels_on_user_id", using: :btree
  add_index "travels", ["vehicle_id"], name: "index_travels_on_vehicle_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.string   "brand"
    t.string   "model"
    t.integer  "year"
    t.string   "licencePlate"
    t.decimal  "odometerActual"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_foreign_key "cities", "states"
  add_foreign_key "fuels", "travels"
  add_foreign_key "lodgings", "travels"
  add_foreign_key "meals", "travels"
  add_foreign_key "toll_booths", "travels"
  add_foreign_key "travels", "cities"
  add_foreign_key "travels", "users"
  add_foreign_key "travels", "vehicles"
end
