class CreatePpjbAndAjbDocument < ActiveRecord::Migration[8.0]
  def change
    create_table :ppjb_documents do |t|
      t.integer :ajb_number
      t.integer :booking_fee_number
      t.integer :down_payment_number
      t.integer :order_number
      t.string  :villa_booked_unit
      t.string  :villa_booked_cluster
      t.string  :villa_booked_street
      t.string  :fullname
      t.integer :nik
      t.integer :occupation
      t.string  :status
      t.string  :scan_ppjb_document

      t.timestamps
    end

    create_table :ajb_documents do |t|
      t.integer :ppjb_number
      t.integer :booking_fee_number
      t.integer :down_payment_number
      t.integer :order_number
      t.string  :villa_booked_unit
      t.string  :villa_booked_cluster
      t.string  :villa_booked_street
      t.string  :fullname
      t.integer :nik
      t.integer :occupation
      t.string  :status
      t.string  :documentation_photo
      t.string  :scan_ajb_document

      t.timestamps
    end    
  end
end
