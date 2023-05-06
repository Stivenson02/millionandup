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

ActiveRecord::Schema[7.0].define(version: 2023_03_12_210659) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.string "discountPercentage", null: false
    t.bigint "category_id", null: false
    t.string "thumbnail", null: false
    t.integer "stock", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "trolley_details", force: :cascade do |t|
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "trolley_id", null: false
    t.bigint "product_id", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.index ["product_id"], name: "index_trolley_details_on_product_id"
    t.index ["trolley_id"], name: "index_trolley_details_on_trolley_id"
  end

  create_table "trolleys", force: :cascade do |t|
    t.string "user_ip"
    t.integer "status", null: false
    t.string "total", default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "products", "product_categories", column: "category_id"
  add_foreign_key "trolley_details", "products"
  add_foreign_key "trolley_details", "trolleys"
end
