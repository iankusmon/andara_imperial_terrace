# db/migrate/xxxx_add_fields_to_nups.rb
class AddFieldsToNups < ActiveRecord::Migration[6.1]
  def change
    add_column :nups, :income, :string
    add_column :nups, :npwp, :string
    add_column :nups, :phone, :string
    add_column :nups, :email, :string
    add_column :nups, :bank_name, :string
    add_column :nups, :account_holder, :string
    add_column :nups, :account_number, :string
  end
end
