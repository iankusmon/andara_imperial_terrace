class AddReferralCodeToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :referral_code, :string
    add_index :customers, :referral_code
  end
end
