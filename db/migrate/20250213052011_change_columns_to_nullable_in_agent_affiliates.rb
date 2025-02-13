class ChangeColumnsToNullableInAgentAffiliates < ActiveRecord::Migration[6.1]
  def change
    change_column_null :agent_affiliates, :name, false
    change_column_null :agent_affiliates, :email, false
    change_column_null :agent_affiliates, :password_digest, true
    change_column_null :agent_affiliates, :mobile, false
    change_column_null :agent_affiliates, :referral_code, true
    change_column_null :agent_affiliates, :nik, true
  end
end
