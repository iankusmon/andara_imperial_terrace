class AddKprTenorPeriodToBookingFee < ActiveRecord::Migration[8.0]
  def change
    add_column :booking_fees, :kpr_tenor_period, :integer
  end
end
