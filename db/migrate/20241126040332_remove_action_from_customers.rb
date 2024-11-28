class RemoveActionFromCustomers < ActiveRecord::Migration[8.0]
  def change
    remove_column :customers, :action, :integer
  end
end
