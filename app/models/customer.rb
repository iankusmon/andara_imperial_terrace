class Customer < ApplicationRecord
  has_secure_password
  belongs_to :agent_affiliate, optional: true
  
    # Enumerations
    enum :gender, {
      male: 0,
      female: 1
    }

    belongs_to :agent_affiliate, optional: true
    has_many :transactions
    before_create :assign_agent_affiliate

    #Enum
    enum :roles, { 
        customer: 0, 
        agen_affiliate: 1 
    }
    # Associations
    has_many :villa_units
    has_many :villa_rent_units
    has_many :visit_records
    has_many :customer_adddresses
    has_many :packages
    has_many :kpr_documents

    def assign_agent_affiliate
      if self.referral_code.present?
        agent = AgentAffiliate.find_by(referral_code: self.referral_code)
        self.agent_affiliate = agent if agent
      end
    end
end
