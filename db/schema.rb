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

ActiveRecord::Schema.define(version: 20160520084853) do

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
  end

  create_table "apply_services", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "tel"
    t.string   "activity_service_id"
    t.date     "expected_date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "photo"
    t.text     "detail"
    t.string   "name"
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
  end

  add_index "listings", ["access_token"], name: "index_listings_on_access_token", unique: true, using: :btree

  create_table "major_cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "prefecture_id"
  end

  create_table "notices", force: :cascade do |t|
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "tel"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "activity_service_id"
    t.string   "customer_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
