class CreatePpjbDocument < ActiveRecord::Migration[8.0]
  def change
    create_table :ppjb_documents do |t|
      t.integer :ppjb_number
      t.integer :customer_id
      t.string :customer_name
      t.integer :nik
      t.integer :mobile
      t.integer :villa_type
      t.integer :floor_type
      t.integer :villa_price
      t.integer :order_number
      t.integer :down_payment_status
      t.string :down_payment_receipt_url
      t.string :scan_ppjb_document
      t.integer :upload_status

      t.timestamps
    end
  end
end
