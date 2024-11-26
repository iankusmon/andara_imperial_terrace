class ChangeHouseUnitsToVillaUnits < ActiveRecord::Migration[8.0]
  def change
    rename_table :house_units, :villa_units
  end
end
