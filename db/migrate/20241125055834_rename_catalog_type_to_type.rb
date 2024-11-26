class RenameCatalogTypeToType < ActiveRecord::Migration[8.0]
  def change
    rename_column :villa_units, :catalog_type, :type
  end
end
