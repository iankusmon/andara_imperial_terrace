class CreateVillaUnitKavling < ActiveRecord::Migration[8.0]
  def change
    create_table :villa_unit_kavlings do |t|
      t.integer :kavling_id
      t.integer :nup_id
      t.integer :booking_fee_id
      t.integer :down_payment_id
      t.integer :pelunasan_id
      t.integer :approved_by
      t.text    :description
      t.integer :payment_status
      t.integer :kavling_type
      t.integer :availability_status
      t.text    :street_address
      t.float   :price
      t.integer :surface_area
      t.integer :building_area
    end
  end
end
