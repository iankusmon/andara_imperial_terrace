class AddVillaThemeToVillaUnits < ActiveRecord::Migration[8.0]
  def change
    add_column :villa_units, :villa_theme, :integer
  end
end
