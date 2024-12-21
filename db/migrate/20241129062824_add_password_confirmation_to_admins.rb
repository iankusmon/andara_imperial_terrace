class AddPasswordConfirmationToAdmins < ActiveRecord::Migration[8.0]
  def change
    add_column :admins, :password_confirmation, :string
  end
end
