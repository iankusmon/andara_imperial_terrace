class RenameHouseRentIdToVillaRentId < ActiveRecord::Migration[8.0]
  def change
    rename_column :customers, :house_rent_id, :villa_rent_id
  end
end
