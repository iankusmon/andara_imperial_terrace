class RenameTypeToVillaTypeInVillaUnits < ActiveRecord::Migration[8.0]
  def change
    rename_column :villa_units, :type, :villa_type
  end
end
