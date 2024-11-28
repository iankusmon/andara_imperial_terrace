class CreateCustomerAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :customer_addresses do |t|
      t.string :label
      t.string :receiver_name
      t.string :receiver_mobile
      t.string :provinsi
      t.string :kota
      t.string :kecamatan
      t.text :street_address
      t.integer :kode_pos
      t.string :address_note
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      
      t.timestamps
    end
  end
end
