class ChangeStatusToStringInAgentAffiliateRewards < ActiveRecord::Migration[6.1]
  def change
    change_column :agent_affiliate_rewards, :status, :string, default: "pending"
  end
end
