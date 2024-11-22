class ChangeTypeDestinationIdsInTourPackages < ActiveRecord::Migration[8.0]
  def change
    change_column :tour_packages, :destination_ids, :text, default: [].to_yaml
  end
end
