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

ActiveRecord::Schema.define(version: 20161007091246) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airlines", force: :cascade do |t|
    t.string   "airline_name"
    t.string   "airline_alias"
    t.string   "iata_code"
    t.string   "icao_code"
    t.string   "call_sign"
    t.string   "country"
    t.boolean  "active"
    t.boolean  "is_deleted"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "airports", force: :cascade do |t|
    t.string   "airport_name"
    t.string   "city"
    t.string   "country"
    t.string   "iata_faa_code"
    t.string   "icao_code"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.decimal  "altitude"
    t.string   "timezone"
    t.string   "dst"
    t.string   "tz_database_timezone"
    t.boolean  "is_deleted"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.string   "booking_code"
    t.boolean  "is_deleted"
    t.integer  "flight_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "email"
    t.index ["flight_id"], name: "index_bookings_on_flight_id", using: :btree
  end

  create_table "flights", force: :cascade do |t|
    t.string   "flight_code"
    t.integer  "airline_id"
    t.string   "airline_code"
    t.integer  "source_airport_id"
    t.string   "source_airport"
    t.integer  "destination_airport_id"
    t.string   "destination_airport"
    t.string   "gate_id"
    t.datetime "departure_date"
    t.datetime "arrival_date"
    t.decimal  "cost"
    t.integer  "capacity"
    t.integer  "available_seats"
    t.string   "codeshare"
    t.integer  "stops"
    t.string   "equipment"
    t.boolean  "is_deleted"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.string   "passenger_name"
    t.string   "passport_number"
    t.integer  "booking_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["booking_id"], name: "index_passengers_on_booking_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.integer  "role_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

end
