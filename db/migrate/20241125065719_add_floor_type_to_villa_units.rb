class AddFloorTypeToVillaUnits < ActiveRecord::Migration[8.0]
  def change
    add_column :villa_units, :floor_type, :string
  end
end