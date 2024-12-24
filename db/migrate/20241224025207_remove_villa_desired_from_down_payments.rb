class RemoveVillaDesiredFromDownPayments < ActiveRecord::Migration[8.0]
  def change
    remove_column :down_payments, :villa_desired, :integer
  end
end
