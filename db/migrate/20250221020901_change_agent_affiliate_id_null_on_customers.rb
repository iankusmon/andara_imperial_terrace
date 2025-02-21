class ChangeAgentAffiliateIdNullOnCustomers < ActiveRecord::Migration[8.0]
  def change
    change_column_null :customers, :agent_affiliate_id, true
  end
end
