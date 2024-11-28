class AddFieldsToAdmins < ActiveRecord::Migration[8.0]
  def change
    add_column :admins, :password, :string
    add_column :admins, :password_digest, :string
    add_column :admins, :photo_profil_url, :string
  end
end
