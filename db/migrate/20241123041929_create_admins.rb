class CreateAdmins < ActiveRecord::Migration[8.0]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :mobile
      t.datetime :last_login_at
      t.integer :roles

      t.timestamps
    end
  end
end
