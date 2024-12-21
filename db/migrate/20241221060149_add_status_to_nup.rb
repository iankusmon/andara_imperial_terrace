class AddStatusToNup < ActiveRecord::Migration[8.0]
  def change
    add_column :nups, :status, :integer
  end
end
