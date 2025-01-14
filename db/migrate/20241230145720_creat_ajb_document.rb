class CreatAjbDocument < ActiveRecord::Migration[8.0]
  def change
    create_table :ajb_documents do |t|
      t.integer :ajb_number
      t.integer :ppjb_number
      t.integer :customer_id
      t.string :customer_name
      t.integer :nik
      t.integer :mobile
      t.integer :villa_unit_type
      t.integer :villa_floor_type
      t.integer :villa_price
      t.integer :order_number
      t.integer :booking_fee_status
      t.string :booking_fee_receipt_url
      t.integer :down_payment_status
      t.string :down_payment_receipt_url
      t.integer :payment_type
      t.integer :payment_type_status
      t.string :scan_ajb_document
      t.integer :ajb_upload_status
      t.timestamps
    end
  end
end
