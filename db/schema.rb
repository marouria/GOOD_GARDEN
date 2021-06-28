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

ActiveRecord::Schema.define(version: 2021_06_28_095459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "kit_plants", force: :cascade do |t|
    t.bigint "plant_id", null: false
    t.bigint "kit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kit_id"], name: "index_kit_plants_on_kit_id"
    t.index ["plant_id"], name: "index_kit_plants_on_plant_id"
  end

  create_table "kits", force: :cascade do |t|
    t.string "slot"
    t.string "img_url"
    t.string "name"
    t.boolean "tools", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_kits_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "status"
    t.bigint "user_id", null: false
    t.bigint "kit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kit_id"], name: "index_orders_on_kit_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.integer "sunshine_rate"
    t.integer "watering"
    t.string "img_url"
    t.string "season"
    t.string "user_level"
    t.integer "price"
    t.integer "stock"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "kit_plants", "kits"
  add_foreign_key "kit_plants", "plants"
  add_foreign_key "kits", "users"
  add_foreign_key "orders", "kits"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "users"
end
