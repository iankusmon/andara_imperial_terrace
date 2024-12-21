class AddNikToCustomers < ActiveRecord::Migration[8.0]
  def change
    add_column :customers, :nik, :integer
  end
end
