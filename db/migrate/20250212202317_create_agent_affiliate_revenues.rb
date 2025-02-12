class CreateAgentAffiliateRevenues < ActiveRecord::Migration[7.0]
  def change
    create_table :agent_affiliate_revenues do |t|
      t.references :agent_affiliate, null: false, foreign_key: true
      t.decimal :total_commissions, precision: 15, scale: 2, default: 0.0
      t.decimal :total_rewards, precision: 15, scale: 2, default: 0.0
      t.decimal :net_revenue, precision: 15, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
