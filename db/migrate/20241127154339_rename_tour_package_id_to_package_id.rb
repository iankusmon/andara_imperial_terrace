class RenameTourPackageIdToPackageId < ActiveRecord::Migration[8.0]
  def change
    rename_column :customers, :tour_package_id, :package_id
  end
end
