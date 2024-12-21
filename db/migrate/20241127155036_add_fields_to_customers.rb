class AddFieldsToCustomers < ActiveRecord::Migration[8.0]
  def change
    add_column :customers, :is_buyer, :boolean
    add_column :customers, :is_renter, :boolean
    add_column :customers, :is_package, :boolean
    add_column :customers, :is_package_buyer, :boolean
    add_column :customers, :password, :string
    add_column :customers, :password_digest, :string
    add_column :customers, :photo_profile_url, :string
    add_column :customers, :customer_address_id, :integer
  end
end
