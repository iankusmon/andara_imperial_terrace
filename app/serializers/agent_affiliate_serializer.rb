class AgentAffiliateSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :mobile, :referral_code, :photo_profile_url, :created_at, :updated_at

  # Associations
  has_many :agent_affiliate_commissions
  has_many :agent_affiliate_rewards
  has_many :agent_affiliate_revenues
end
