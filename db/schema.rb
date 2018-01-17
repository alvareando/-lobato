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

ActiveRecord::Schema.define(version: 20180117003634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booking_participations", force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_participations_on_booking_id"
    t.index ["user_id"], name: "index_booking_participations_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.time "time"
    t.date "date"
    t.integer "people"
    t.bigint "restaurant_id"
    t.bigint "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.index ["menu_id"], name: "index_bookings_on_menu_id"
    t.index ["restaurant_id"], name: "index_bookings_on_restaurant_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.string "price"
    t.text "description"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "menu_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_dishes_on_category_id"
    t.index ["menu_id"], name: "index_dishes_on_menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.bigint "restaurant_id"
    t.string "menu_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_menus_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_restaurants_on_user_id"
  end

  create_table "simple_bookings", force: :cascade do |t|
    t.time "time"
    t.date "date"
    t.integer "people"
    t.string "name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.bigint "restaurant_id"
    t.bigint "user_id"
    t.index ["restaurant_id"], name: "index_simple_bookings_on_restaurant_id"
    t.index ["user_id"], name: "index_simple_bookings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "booking_participations", "bookings"
  add_foreign_key "booking_participations", "users"
  add_foreign_key "bookings", "menus"
  add_foreign_key "bookings", "restaurants"
  add_foreign_key "dishes", "categories"
  add_foreign_key "menus", "restaurants"
  add_foreign_key "restaurants", "users"
  add_foreign_key "simple_bookings", "restaurants"
  add_foreign_key "simple_bookings", "users"
end
