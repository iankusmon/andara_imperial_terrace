class DropPpjbDocumentTable < ActiveRecord::Migration[8.0]
  def up
    drop_table :ppjb_documents
  end

  def down
    create_table "ppjb_documents", force: :cascade do |t|
      t.integer "ajb_number"
      t.integer "booking_fee_number"
      t.integer "down_payment_number"
      t.integer "order_number"
      t.string "villa_booked_unit"
      t.string "villa_booked_cluster"
      t.string "villa_booked_street"
      t.string "fullname"
      t.integer "nik"
      t.integer "occupation"
      t.integer "status"
      t.string "scan_ppjb_document"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
