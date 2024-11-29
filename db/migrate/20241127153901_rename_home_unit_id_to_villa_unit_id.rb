class RenameHomeUnitIdToVillaUnitId < ActiveRecord::Migration[8.0]
  def change
    rename_column :customers, :home_unit_id, :villa_unit_id
  end
end
