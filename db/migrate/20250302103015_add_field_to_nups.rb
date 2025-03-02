class AddFieldToNups < ActiveRecord::Migration[8.0]
  def change
    add_column :nups, :villa_unit_desired, :string
  end
end
