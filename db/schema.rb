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

ActiveRecord::Schema[8.0].define(version: 2024_12_22_153644) do
  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "mobile"
    t.datetime "last_login_at"
    t.integer "roles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
    t.string "password_digest"
    t.string "photo_profil_url"
    t.string "password_confirmation"
    t.integer "active_status", default: 1
  end

  create_table "booking_fees", force: :cascade do |t|
    t.integer "booking_fee_number"
    t.integer "order_number"
    t.integer "payment_type"
    t.integer "payment_method"
    t.integer "cash_tempo_period"
    t.string "fullname"
    t.integer "nik"
    t.integer "occupation"
    t.string "scan_ktp_url"
    t.string "scan_kk_url"
    t.string "scan_npwp_url"
    t.string "scan_buku_nikah_url"
    t.string "scan_last_3_months_slip_gaji_url"
    t.string "scan_last_3_months_rekening_koran_url"
    t.string "scan_sk_pekerjaan_url"
    t.string "scan_fc_legal_usaha_url"
    t.string "scan_laporan_keuangan_url"
    t.string "scan_last_3_months_rekening_koran_usaha_url"
    t.string "status"
    t.string "payment_receipt_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_addresses", force: :cascade do |t|
    t.string "label"
    t.string "receiver_name"
    t.string "receiver_mobile"
    t.string "provinsi"
    t.string "kota"
    t.string "kecamatan"
    t.text "street_address"
    t.integer "kode_pos"
    t.string "address_note"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "username"
    t.string "mobile"
    t.string "referreral_code"
    t.integer "visit_id"
    t.integer "kpr_document_id"
    t.integer "villa_unit_id"
    t.datetime "last_login_at"
    t.integer "villa_rent_id"
    t.integer "package_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_buyer"
    t.boolean "is_renter"
    t.boolean "is_package"
    t.boolean "is_package_buyer"
    t.string "password"
    t.string "password_digest"
    t.string "photo_profile_url"
    t.integer "customer_address_id"
    t.integer "nik"
    t.integer "roles"
    t.boolean "is_deleted", default: false
    t.string "password_confirmation"
    t.datetime "birthday"
    t.integer "gender"
  end

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

  create_table "nups", force: :cascade do |t|
    t.integer "nup_number"
    t.integer "order_number"
    t.string "fullname"
    t.integer "nik"
    t.integer "occupation"
    t.string "scan_ktp_url"
    t.integer "package"
    t.integer "villa_desired"
    t.integer "payment_method"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.string "payment_receipt_url"
  end

  create_table "share_social_media", force: :cascade do |t|
    t.integer "name"
    t.boolean "is_callback"
    t.string "callback_url"
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

  create_table "villa_units", force: :cascade do |t|
    t.string "nup"
    t.integer "payment_status"
    t.integer "approved_by"
    t.datetime "installment_begins_at"
    t.datetime "installment_ends_at"
    t.integer "drop_point_status"
    t.integer "booking_fee_status"
    t.integer "installments_paid"
    t.integer "installment_remaining"
    t.datetime "drop_point_paid_date"
    t.datetime "booking_fee_paid_date"
    t.integer "commision_rule_id"
    t.string "description"
    t.integer "type"
    t.integer "availability_status"
    t.string "street_address"
    t.float "price"
    t.integer "surface_area"
    t.integer "building_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "floor_type"
    t.integer "villa_type"
  end

  create_table "visit_records", force: :cascade do |t|
    t.integer "page"
    t.datetime "time_starts"
    t.datetime "time_ends"
    t.boolean "is_share"
    t.integer "share_social_media_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
