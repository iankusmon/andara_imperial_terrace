module Api
  class AgentAffiliatesController < ApplicationController
    before_action :set_agent, only: [:generate_referral_link, :commissions, :rewards, :revenues]

    def sign_up
      agent = AgentAffiliate.new(agent_affiliate_params)
    
      if params[:referral_code].present?
        referrer = AgentAffiliate.find_by(referral_code: params[:referral_code])
        agent.affiliated_customer_id = referrer.id if referrer
      end
    
      # agent.password_digest = agent_affiliate_params[:password]
    
      if agent.save
        # Buat reward signup dengan status default "pending"
        AgentAffiliateReward.create!(
          agent_affiliate: agent,
          # reward_type: Reward.find_by(name: "Signup Bonus"), # Sesuaikan dengan reward signup yang ada
          status: "pending",
          reward_type: "signup",
          reward_amount: 500_000 # Sesuaikan jumlah reward signup
        )
    
        # Kirim email selamat datang
        # AgentAffiliateMailer.welcome_email(agent).deliver_later
        # Kirim WhatsApp
        send_whatsapp_notification(agent)
        
        render json: { message: 'Signup berhasil!' }, status: :created
      else
        render json: { errors: agent.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def generate_referral_link
      referral_link = "#{request.base_url}/signup?referral_code=#{@agent.referral_code}"
      render json: { referral_link: referral_link }
    end

    def commissions
      commissions = @agent.agent_affiliate_commissions
      render json: { commissions: commissions }
    end

    def rewards
      rewards = @agent.agent_affiliate_rewards
      render json: { rewards: rewards }
    end

    def revenues
      revenues = @agent.agent_affiliate_revenues
      render json: { revenues: revenues }
    end

    # POST /api/admin/agent_affiliates/:id/register_customer
    def register_customer
      customer = Customer.new(customer_params.merge(agent_affiliate: @agent))
      if customer.save
        render json: { message: 'Customer registered successfully', customer: customer }, status: :created
      else
        render json: { errors: customer.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private
    
    def set_agent
      @agent = AgentAffiliate.find(params[:id])
    end

    def agent_affiliate_params
      params.require(:agent_affiliate).permit(:name, :email, :password, :password_confirmation, 
        :photo_profile_url, :mobile, :referral_code, :nik, :occupation, :age, :gender, 
        :married_status, :education, :salary_range, :address, :emergency_email, 
        :emergency_mobile_number, :emergency_address)
    end

    def send_whatsapp_notification(agent)
      WatiService.send_message(agent)
    end

    def customer_params
      params.require(:customer).permit(:name, :email, :username, :mobile, :referral_code, :visit_id, 
        :kpr_document_id, :villa_unit_id, :last_login_at, :villa_rent_id, :package_id, 
        :is_buyer, :is_renter, :is_package, :is_package_buyer, :password, :password_digest, 
        :photo_profile_url, :customer_address_id, :password_confirmation, :birthday, :gender, 
        :nik, :roles, :is_deleted)
    end
  
  end
end