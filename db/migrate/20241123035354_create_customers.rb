class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :mobile
      t.string :referreral_code
      t.integer :visit_id
      t.integer :kpr_document_id
      t.integer :home_unit_id
      t.integer :action
      t.datetime :last_login_at
      t.integer :house_rent_id
      t.integer :tour_package_id

      t.timestamps
    end
  end
end
