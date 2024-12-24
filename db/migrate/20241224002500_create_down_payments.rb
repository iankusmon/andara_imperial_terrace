class CreateDownPayments < ActiveRecord::Migration[8.0]
  def change
    create_table :down_payments do |t|
      t.integer :down_payment_number
      t.integer :order_number
      t.integer :payment_type
      t.integer :payment_method
      t.integer :payment_amount
      t.integer :tempo_period
      t.string  :fullname
      t.integer :nik
      t.integer :occupation
      t.integer :villa_desired
      t.string  :status
      t.string  :payment_receipt_url
      t.text    :note

      t.timestamps
    end
  end
end
