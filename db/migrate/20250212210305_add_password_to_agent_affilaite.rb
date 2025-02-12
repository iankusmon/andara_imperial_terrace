class AddPasswordToAgentAffilaite < ActiveRecord::Migration[8.0]
  def change
    add_column :agent_affiliates, :password, :string
    add_column :agent_affiliates, :password_confirmation, :string
  end
end
