class AddNoteToBookingFeeNup < ActiveRecord::Migration[8.0]
  def change
    add_column :nups, :note, :text
    add_column :booking_fees, :note, :text
  end
end
