class RemoveClusterTypeColumnInVillaUnits < ActiveRecord::Migration[8.0]
  def change
    remove_column :villa_units, :cluster_type
  end
end
