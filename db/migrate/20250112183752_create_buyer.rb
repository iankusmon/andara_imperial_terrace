class CreateBuyer < ActiveRecord::Migration[8.0]
  def change
    create_table :buyers do |t|
      t.integer :nup_id
      t.integer :booking_fee_id
      t.integer :down_payment_id
      t.integer :pelunasan_id
      t.string :name
      t.string :nik
      t.string :mobile
      t.integer :villa_unit_kavling_id
      t.integer :payment_type
      t.integer :payment_method
    end
  end
end
