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

ActiveRecord::Schema.define(version: 20161226102835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activity_services", force: :cascade do |t|
    t.string   "photo"
    t.string   "amount"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "detail"
    t.string   "major_city_id"
    t.string   "prefecture_id"
    t.string   "category_id"
    t.string   "name"
    t.string   "address"
    t.time     "start_time_at"
    t.time     "end_time_at"
    t.string   "url"
    t.string   "tel"
  end

  create_table "ads", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "corp"
    t.string   "thumbnail"
  end

  create_table "apply_services", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "tel"
    t.string   "activity_service_id"
    t.date     "expected_date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.boolean  "accept"
    t.text     "note"
    t.time     "expected_time"
  end

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "prefecture_id"
    t.text     "introduce_area"
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "photo"
    t.text     "detail"
    t.string   "name"
  end

  create_table "emergency_calls", force: :cascade do |t|
    t.string   "name"
    t.string   "tel"
    t.string   "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hospitals", force: :cascade do |t|
    t.string   "name"
    t.string   "detail"
    t.string   "address"
    t.string   "tel"
    t.string   "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url"
  end

  create_table "listing_details", force: :cascade do |t|
    t.integer  "listing_id"
    t.string   "name"
    t.string   "photo_url"
    t.text     "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "photo"
    t.string   "manual"
    t.string   "map"
    t.string   "access_token", limit: 12, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "host_email"
    t.string   "address_en"
    t.string   "checkin"
    t.string   "checkout"
    t.text     "house_rule"
    t.text     "question"
  end

  add_index "listings", ["access_token"], name: "index_listings_on_access_token", unique: true, using: :btree

  create_table "major_cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "prefecture_id"
    t.string   "area_id"
    t.string   "pickup_photo_url"
    t.integer  "pickup_photo_primary"
  end

  create_table "notices", force: :cascade do |t|
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "activity_service_id"
    t.string   "customer_id"
    t.string   "apply_service_id"
  end

  add_index "payments", ["apply_service_id"], name: "index_payments_on_apply_service_id", unique: true, using: :btree

  create_table "prefectures", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "japanese_name"
    t.string   "cuisines"
    t.text     "detail"
    t.string   "tel"
    t.text     "tel_note"
    t.string   "address"
    t.string   "access"
    t.text     "hours"
    t.string   "close"
    t.string   "average_price"
    t.string   "cards_accepted"
    t.string   "smoking"
    t.string   "kid_friendly"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "area_id"
    t.string   "photo_url_top"
    t.string   "photo_url_1"
    t.string   "photo_url_2"
    t.string   "photo_url_3"
    t.string   "photo_url_4"
    t.string   "photo_url_5"
    t.string   "photo_url_6"
    t.string   "photo_url_7"
    t.string   "photo_url_8"
    t.string   "photo_url_9"
    t.text     "detail_address"
    t.text     "language"
  end

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
    t.boolean  "admin"
    t.string   "name"
    t.string   "tel"
    t.string   "line"
    t.string   "facebook"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
