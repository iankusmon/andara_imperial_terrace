class AddBankDetailsToAgentAffiliates < ActiveRecord::Migration[8.0]
  def change
    add_column :agent_affiliates, :bank, :string
    add_column :agent_affiliates, :bank_branch, :string
    add_column :agent_affiliates, :account_number, :string
    add_column :agent_affiliates, :account_name, :string
  end
end
