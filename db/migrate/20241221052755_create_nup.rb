class CreateNup < ActiveRecord::Migration[8.0]
  def up
    create_table :nups do |t|
      t.integer :nup_number
      t.integer :order_number
      t.string :fullname
      t.integer :nik
      t.integer :occupation
      t.string :scan_ktp_url
      t.integer :package
      t.integer :villa_desired
      t.integer :payment_method
      t.text :address

      t.timestamps
    end
  end

  def down
    drop_table :nups
  end
end
