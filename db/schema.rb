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

ActiveRecord::Schema[8.0].define(version: 2025_02_13_052011) do
  create_table "accommodation_banners", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image_url"
    t.string "link_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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

  create_table "agent_affiliate_banners", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image_url"
    t.string "link_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agent_affiliate_commissions", force: :cascade do |t|
    t.integer "agent_affiliate_id", null: false
    t.integer "property_unit_id", null: false
    t.decimal "unit_price", precision: 15, scale: 2, null: false
    t.decimal "commission_percentage", precision: 5, scale: 2, default: "2.0"
    t.decimal "commission_amount", precision: 15, scale: 2, null: false
    t.boolean "dp_30_paid", default: false
    t.datetime "paid_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_affiliate_id"], name: "index_agent_affiliate_commissions_on_agent_affiliate_id"
    t.index ["property_unit_id"], name: "index_agent_affiliate_commissions_on_property_unit_id"
  end

  create_table "agent_affiliate_revenues", force: :cascade do |t|
    t.integer "agent_affiliate_id", null: false
    t.decimal "total_commissions", precision: 15, scale: 2, default: "0.0"
    t.decimal "total_rewards", precision: 15, scale: 2, default: "0.0"
    t.decimal "net_revenue", precision: 15, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_affiliate_id"], name: "index_agent_affiliate_revenues_on_agent_affiliate_id"
  end

  create_table "agent_affiliate_rewards", force: :cascade do |t|
    t.integer "agent_affiliate_id", null: false
    t.string "reward_type", null: false
    t.decimal "reward_amount", precision: 15, scale: 2, null: false
    t.integer "sales_count", default: 0
    t.boolean "dp_30_paid", default: false
    t.datetime "paid_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pending"
    t.index ["agent_affiliate_id"], name: "index_agent_affiliate_rewards_on_agent_affiliate_id"
  end

  create_table "agent_affiliates", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "photo_profile_url"
    t.string "mobile", null: false
    t.string "referral_code"
    t.datetime "last_login_at"
    t.string "full_name"
    t.string "nik"
    t.string "occupation"
    t.integer "age"
    t.string "gender"
    t.string "married_status"
    t.string "education"
    t.string "salary_range"
    t.text "address"
    t.string "emergency_email"
    t.string "emergency_mobile_number"
    t.text "emergency_address"
    t.bigint "affiliated_customer_id"
    t.bigint "commission_id"
    t.bigint "reward_id"
    t.bigint "revenue_id"
    t.decimal "signup_reward", precision: 15, scale: 2, default: "500000.0"
    t.boolean "reward_eligible", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
    t.string "password_confirmation"
    t.index ["email"], name: "index_agent_affiliates_on_email", unique: true
    t.index ["mobile"], name: "index_agent_affiliates_on_mobile", unique: true
    t.index ["nik"], name: "index_agent_affiliates_on_nik", unique: true
    t.index ["referral_code"], name: "index_agent_affiliates_on_referral_code", unique: true
  end

  create_table "ajb_documents", force: :cascade do |t|
    t.integer "ajb_number"
    t.integer "ppjb_number"
    t.integer "customer_id"
    t.string "customer_name"
    t.integer "nik"
    t.integer "mobile"
    t.integer "villa_unit_type"
    t.integer "villa_floor_type"
    t.integer "villa_price"
    t.integer "order_number"
    t.integer "booking_fee_status"
    t.string "booking_fee_receipt_url"
    t.integer "down_payment_status"
    t.string "down_payment_receipt_url"
    t.integer "payment_type"
    t.integer "payment_type_status"
    t.binary "upload_ajb_doc"
    t.integer "ajb_upload_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "scan_last_6_months_rekening_koran_usaha_url"
    t.integer "status"
    t.string "payment_receipt_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "note"
    t.integer "kpr_tenor_period"
    t.binary "upload_spkb_doc"
  end

  create_table "buyers", force: :cascade do |t|
    t.integer "nup_id"
    t.integer "booking_fee_id"
    t.integer "down_payment_id"
    t.integer "pelunasan_id"
    t.string "name"
    t.string "nik"
    t.string "mobile"
    t.integer "villa_unit_kavling_id"
    t.integer "payment_type"
    t.integer "payment_method"
  end

  create_table "cms_article_meta_data", force: :cascade do |t|
    t.integer "cms_article_id"
    t.text "title"
    t.text "keyword"
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["cms_article_id"], name: "index_cms_article_meta_data_on_cms_article_id"
  end

  create_table "cms_article_sections", force: :cascade do |t|
    t.integer "cms_article_id"
    t.text "title"
    t.string "image_url"
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["cms_article_id"], name: "index_cms_article_sections_on_cms_article_id"
  end

  create_table "cms_articles", force: :cascade do |t|
    t.string "title", null: false
    t.text "summary"
    t.text "introduction"
    t.text "closing"
    t.string "hero_img_url"
    t.string "url", null: false
    t.integer "active_status"
    t.integer "category", null: false
    t.datetime "published_at", precision: nil
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
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
    t.string "password_confirmation"
    t.datetime "birthday"
    t.integer "gender"
    t.integer "nik"
    t.integer "roles"
    t.boolean "is_deleted", default: false
  end

  create_table "day_club_banners", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image_url"
    t.string "link_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "picture_url"
    t.integer "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "down_payments", force: :cascade do |t|
    t.integer "down_payment_number"
    t.integer "order_number"
    t.integer "payment_type"
    t.integer "payment_method"
    t.integer "payment_amount"
    t.integer "tempo_period"
    t.string "fullname"
    t.integer "nik"
    t.integer "occupation"
    t.integer "status"
    t.string "payment_receipt_url"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facility_video_shorts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "video_url"
    t.string "link_url"
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

  create_table "kprs", force: :cascade do |t|
    t.integer "kpr_id"
    t.integer "customer_id"
    t.string "customer_name"
    t.integer "nik"
    t.integer "mobile"
    t.text "customer_address"
    t.integer "nup_number"
    t.integer "booking_fee_status"
    t.string "url_spkb_document"
    t.integer "down_payment_status"
    t.integer "bank"
    t.date "filing_date"
    t.integer "submission_status"
    t.float "loan_amount"
    t.integer "tenor_period"
    t.float "monthly_installments"
    t.date "due_date"
    t.text "note"
    t.integer "kpr_payment_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landmark_banners", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image_url"
    t.string "link_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "main_banners", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image_url"
    t.string "link_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mice_banners", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image_url"
    t.string "link_url"
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
    t.text "note"
  end

  create_table "ppjb_documents", force: :cascade do |t|
    t.integer "ppjb_number"
    t.integer "customer_id"
    t.string "customer_name"
    t.integer "nik"
    t.integer "mobile"
    t.integer "villa_unit_type"
    t.integer "villa_floor_type"
    t.integer "villa_price"
    t.integer "order_number"
    t.integer "down_payment_status"
    t.string "down_payment_receipt_url"
    t.binary "upload_ppjb_doc"
    t.integer "upload_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "villa_unit_kavlings", force: :cascade do |t|
    t.integer "kavling_id"
    t.integer "nup_id"
    t.integer "booking_fee_id"
    t.integer "down_payment_id"
    t.integer "pelunasan_id"
    t.integer "approved_by"
    t.text "description"
    t.integer "payment_status"
    t.integer "kavling_type"
    t.integer "availability_status"
    t.text "street_address"
    t.float "price"
    t.integer "surface_area"
    t.integer "building_area"
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
    t.integer "eiffel_room_type"
    t.integer "venice_room_type"
    t.integer "villa_theme"
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

  create_table "wisata_modern_banners", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image_url"
    t.string "link_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "agent_affiliate_commissions", "agent_affiliates"
  # add_foreign_key "agent_affiliate_commissions", "property_units"
  add_foreign_key "agent_affiliate_revenues", "agent_affiliates"
  add_foreign_key "agent_affiliate_rewards", "agent_affiliates"
  add_foreign_key "cms_article_meta_data", "cms_articles"
  add_foreign_key "cms_article_sections", "cms_articles"
end
