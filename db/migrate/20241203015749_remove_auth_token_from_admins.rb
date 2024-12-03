class RemoveAuthTokenFromAdmins < ActiveRecord::Migration[8.0]
  def up
    remove_column :admins, :auth_token
  end

  def down
    add_column :admins, :auth_token, :string
    add_index :admins, :auth_token, unique: true
  end

end
