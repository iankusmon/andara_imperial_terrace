class AgentAffiliate < ApplicationRecord
  has_secure_password

  has_many :customers
  has_many :transactions
  has_many :agent_affiliate_commissions
  has_many :agent_affiliate_rewards, dependent: :destroy
  has_many :agent_affiliate_revenues

  before_create :generate_referral_code
  after_create :give_signup_reward  

  def give_signup_reward
    self.agent_affiliate_rewards.create!(
      reward_type: "signup",
      reward_amount: 500000,
      dp_30_paid: false
    )
  end

  # validates :name, :email, :mobile, presence: true
  # validates :email, uniqueness: true

  def generate_referral_code
    self.referral_code = SecureRandom.hex(6).upcase
  end

  def calculate_revenue
    total_commissions = agent_affiliate_commissions.sum(:commission_amount)
    total_rewards = agent_affiliate_rewards.sum(:reward_amount)
    net_revenue = total_commissions + total_rewards

    revenue = agent_affiliate_revenue || create_agent_affiliate_revenue
    revenue.update!(
      total_commissions: total_commissions,
      total_rewards: total_rewards,
      net_revenue: net_revenue
    )
  end
end