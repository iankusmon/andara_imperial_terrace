class AddRolesToCustomers < ActiveRecord::Migration[8.0]
  def change
    add_column :customers, :roles, :integer
  end
end
