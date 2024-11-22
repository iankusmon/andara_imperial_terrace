class CreateHouseUnits < ActiveRecord::Migration[8.0]
  def change
    create_table :house_units do |t|
      t.string :nup
      t.integer :payment_status
      t.integer :approved_by
      t.datetime :installment_begins_at
      t.datetime :installment_ends_at
      t.integer :drop_point_status
      t.integer :booking_fee_status
      t.integer :installments_paid
      t.integer :installment_remaining
      t.datetime :drop_point_paid_date
      t.datetime :booking_fee_paid_date
      t.integer :commision_rule_id
      t.string :description
      t.integer :catalog_type
      t.integer :cluster_type
      t.integer :availability_status
      t.string :street_address
      t.float :price
      t.integer :surface_area
      t.integer :building_area

      t.timestamps
    end
  end
end
