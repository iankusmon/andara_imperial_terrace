class AddEiffelRoomTypeInVillaUnits < ActiveRecord::Migration[8.0]
  def change
    add_column :villa_units, :eiffel_room_type, :integer
  end
end
