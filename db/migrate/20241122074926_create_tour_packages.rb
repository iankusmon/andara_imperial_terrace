class CreateTourPackages < ActiveRecord::Migration[8.0]
  def change
    create_table :tour_packages do |t|
      t.string :name
      t.integer :price
      t.integer :payment_status
      t.integer :drop_point_status
      t.boolean :is_stay
      t.integer :tour_days
      
      t.timestamps

      t.string :destination_ids
    end
  end
end
