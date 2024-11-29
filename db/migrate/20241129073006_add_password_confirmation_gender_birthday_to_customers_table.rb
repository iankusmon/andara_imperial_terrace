class AddPasswordConfirmationGenderBirthdayToCustomersTable < ActiveRecord::Migration[8.0]
  def up
    add_column :customers, :password_confirmation, :string
    add_column :customers, :birthday, :datetime
    add_column :customers, :gender, :integer
  end

  def down
    drop_column :customers, :password_confirmation, :string
    drop_column :customers, :birthday, :datetime
    drop_column :customers, :gender, :integer
  end
end
