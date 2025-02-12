class CreateAgentAffiliateRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :agent_affiliate_rewards do |t|
      t.references :agent_affiliate, null: false, foreign_key: true
      t.string :reward_type, null: false  # ("signup", "flash", "referral", "monthly", "top_sales")
      t.decimal :reward_amount, precision: 15, scale: 2, null: false
      t.integer :sales_count, default: 0  # Untuk Monthly Sales Reward
      t.boolean :dp_30_paid, default: false
      t.datetime :paid_at

      t.timestamps
    end
  end
end
