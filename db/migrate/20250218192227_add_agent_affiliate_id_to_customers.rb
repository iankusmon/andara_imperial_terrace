class AddAgentAffiliateIdToCustomers < ActiveRecord::Migration[8.0]
  def change
    add_reference :customers, :agent_affiliate, null: false, foreign_key: true
  end
end
