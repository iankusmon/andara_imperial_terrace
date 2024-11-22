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

ActiveRecord::Schema[8.0].define(version: 2024_11_22_083858) do
  create_table "destinations", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "picture_url"
    t.integer "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "house_rent_units", force: :cascade do |t|
    t.string "nup"
    t.integer "payment_status"
    t.integer "drop_point_status"
    t.datetime "drop_point_paid_date"
    t.string "description"
    t.integer "catalog_type"
    t.integer "cluster_type"
    t.integer "avaibility_status"
    t.string "street_address"
    t.float "price"
    t.integer "surface_area"
    t.integer "building_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tour_packages", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "payment_status"
    t.integer "drop_point_status"
    t.boolean "is_stay"
    t.integer "tour_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "destination_ids", default: "--- []\n"
  end
end
