class CreateAgentAffiliateCommissions < ActiveRecord::Migration[7.0]
  def change
    create_table :agent_affiliate_commissions do |t|
      t.references :agent_affiliate, null: false, foreign_key: true
      t.references :property_unit, null: false, foreign_key: true
      t.decimal :unit_price, precision: 15, scale: 2, null: false
      t.decimal :commission_percentage, precision: 5, scale: 2, default: 2.0
      t.decimal :commission_amount, precision: 15, scale: 2, null: false
      t.boolean :dp_30_paid, default: false
      t.datetime :paid_at

      t.timestamps
    end
  end
end
