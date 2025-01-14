class AddVeniceRoomTypeInVillaUnits < ActiveRecord::Migration[8.0]
  def change
    add_column :villa_units, :venice_room_type, :integer
  end
end
