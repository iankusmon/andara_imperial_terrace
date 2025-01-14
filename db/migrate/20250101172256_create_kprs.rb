class CreateKprs < ActiveRecord::Migration[8.0]
  def change
    create_table :kprs do |t|
      t.integer :kpr_id
      t.integer :customer_id
      t.string :customer_name
      t.integer :nik
      t.integer :mobile
      t.text :customer_address
      t.integer :nup_number
      t.integer :booking_fee_status
      t.string :url_spkb_document
      t.integer :down_payment_status
      t.integer :bank
      t.date :filing_date
      t.integer :submission_status
      t.float :loan_amount
      t.integer :tenor_period
      t.float :monthly_installments
      t.date :due_date
      t.text :note
      t.integer :kpr_payment_status
      t.timestamps
    end
  end
end
