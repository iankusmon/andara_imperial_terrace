class RenameVillaTypeToTypeInVillaUnits < ActiveRecord::Migration[8.0]
  def change
    rename_column :villa_units, :villa_type, :type
  end
end
