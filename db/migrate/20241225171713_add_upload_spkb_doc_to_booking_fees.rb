class AddUploadSpkbDocToBookingFees < ActiveRecord::Migration[8.0]
  def up
    add_column :booking_fees, :upload_spkb_doc, :binary 
  end

  def down
    remove_column :booking_fees, :upload_spkb_doc
  end
end
