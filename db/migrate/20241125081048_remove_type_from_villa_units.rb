class RemoveTypeFromVillaUnits < ActiveRecord::Migration[8.0]
  def change
    remove_column :villa_units, :type, :string
  end
end
