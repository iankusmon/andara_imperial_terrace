class DropAjbDocumentTable < ActiveRecord::Migration[8.0]
  def up
    drop_table :ajb_documents
  end

  def down
    create_table "ajb_documents", force: :cascade do |t|
      t.integer "ppjb_number"
      t.integer "booking_fee_number"
      t.integer "down_payment_number"
      t.integer "order_number"
      t.string "villa_booked_unit"
      t.string "villa_booked_cluster"
      t.string "villa_booked_street"
      t.string "fullname"
      t.integer "nik"
      t.integer "occupation"
      t.string "status"
      t.string "documentation_photo"
      t.string "scan_ajb_document"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
