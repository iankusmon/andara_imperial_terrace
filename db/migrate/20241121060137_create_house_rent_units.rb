class CreateHouseRentUnits < ActiveRecord::Migration[8.0]
  def change
    create_table :house_rent_units do |t|
      t.string :nup
      t.integer :payment_status
      t.integer :drop_point_status
      t.datetime :drop_point_paid_date
      t.string :description
      t.integer :catalog_type
      t.integer :cluster_type
      t.integer :avaibility_status
      t.string :street_address
      t.float :price
      t.integer :surface_area
      t.integer :building_area

      t.timestamps
    end
  end
end
