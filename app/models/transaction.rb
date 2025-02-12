class Transaction < ApplicationRecord
  after_update :process_commission_and_rewards, if: -> { saved_change_to_dp_30_paid?(from: false, to: true) }

  def process_commission_and_rewards
    agent = agent_affiliate

    # Cairkan komisi 2%
    commission = agent.agent_affiliate_commissions.find_by(property_unit_id: property_unit_id)
    commission.update!(dp_30_paid: true, paid_at: Time.current)

    # Cairkan semua reward yang memenuhi syarat
    agent.agent_affiliate_rewards.where(dp_30_paid: false).update_all(dp_30_paid: true, paid_at: Time.current)

    # Update total revenue
    agent.calculate_revenue
  end
end
