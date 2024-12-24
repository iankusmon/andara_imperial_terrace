class UpdateTypeStatusInBookingFeeAndDownPayment < ActiveRecord::Migration[8.0]
  def change
    change_table :booking_fees do |t|
      t.change :status, :integer
    end

    change_table :down_payments do |t|
      t.change :status, :integer
    end
  end
end
