class AddColumnActiveStatusToAdmin < ActiveRecord::Migration[8.0]
  def up
    add_column :admins, :active_status, :integer, default: 1
  end
  
  def down
    remove_column :admins, :active_status
  end
  
end
