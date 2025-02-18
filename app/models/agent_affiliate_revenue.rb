class AgentAffiliateRevenue < ApplicationRecord
  belongs_to :agent_affiliate
  # belongs_to :reward

  # enum status: { pending: "pending", approved: "approved", paid: "paid" }
  enum :status, { 
    pending: 0,
    approved: 1,
    paid: 2 
  }

  before_create :set_default_status

  private

  def set_default_status
    self.status ||= "pending"
  end
end
