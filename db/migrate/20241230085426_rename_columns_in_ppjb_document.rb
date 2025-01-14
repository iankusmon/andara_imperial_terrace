class RenameColumnsInPpjbDocument < ActiveRecord::Migration[8.0]
  def change
    rename_column :ppjb_documents, :villa_type, :villa_unit_type
    rename_column :ppjb_documents, :floor_type, :villa_floor_type
  end
end
