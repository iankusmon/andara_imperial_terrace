class AddIsDeletedToCustomers < ActiveRecord::Migration[8.0]
  def up
    add_column :customers, :is_deleted, :boolean, default: false
  end

  def down
    remove_column :customers, :is_deleted
  end
end
