class AddVillaTypeToVillaUnits < ActiveRecord::Migration[8.0]
  def change
    add_column :villa_units, :villa_type, :integer
  end
end
