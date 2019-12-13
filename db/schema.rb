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

ActiveRecord::Schema.define(version: 2019_12_13_174402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.bigint "provider_id", null: false
    t.datetime "edate"
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["provider_id"], name: "index_events_on_provider_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.boolean "beverage"
    t.string "item_cat"
    t.bigint "provider_id", null: false
    t.string "img_url"
    t.text "description"
    t.boolean "vegan"
    t.boolean "vegetarian"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["provider_id"], name: "index_menu_items_on_provider_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "biz_name"
    t.string "tax_id"
    t.string "photo_id"
    t.string "website"
    t.string "yelp"
    t.string "biz_phone"
    t.string "category"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_providers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "cell_number"
    t.string "avatar"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "events", "providers"
  add_foreign_key "menu_items", "providers"
  add_foreign_key "providers", "users"
end
