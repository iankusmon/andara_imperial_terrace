class AddAuthTokenToAdmins < ActiveRecord::Migration[8.0]
  def change
    add_column :admins, :auth_token, :string
    add_index :admins, :auth_token, unique: true
  end
end


