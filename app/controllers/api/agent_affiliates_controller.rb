require Rails.root.join("lib", "json_web_token").to_s

module Api
  class AgentAffiliatesController < ApplicationController
    before_action :set_agent, only: [:update, :generate_referral_link, :commissions, :rewards, :revenues, :registered_customers, :logout]
    before_action :authenticate_agent, only: [:profile, :register_customer, :registered_customers]

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
        
        token = JsonWebToken.encode({ agent_id: agent.id })
        render json: { token: token, agent: agent.slice(:id, :name, :email, :photo_profile_url, :mobile, :referral_code) }, status: :ok
      else
        render json: { errors: agent.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def login
      agent = AgentAffiliate.find_by(email: params[:email])

      if agent&.authenticate(params[:password])
        token = JsonWebToken.encode({ agent_id: agent.id })
        render json: { token: token, agent: agent.slice(:id, :name, :email, :photo_profile_url, :mobile, :referral_code) }, status: :ok
      else
        render json: { error: "Email atau password salah" }, status: :unauthorized
      end
    end

    # Endpoint logout
    def logout
      # Karena JWT stateless, server hanya mengembalikan pesan sukses.
      render json: { message: "Logged out successfully" }, status: :ok
    end

    def profile
      render json: { agent: @current_agent }, status: :ok
    end
    
    def show
      render json: { agent: @current_agent }, status: :ok
    end

    # Update profile endpoint
    def update
      if @agent.update(agent_affiliate_params)
        render json: { agent: @agent, message: "Profile updated successfully" }, status: :ok
      else
        render json: { errors: @agent.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # Endpoint: GET /api/agent_affiliates/:id/registered_customers
    def registered_customers
      # Misalnya, kita asumsikan agent affiliate sudah memiliki relasi dengan customer
      # Jika belum, Anda bisa mengambil data dari model Customer berdasarkan kondisi:
      # customers = Customer.where(agent_affiliate_id: @agent.id)
      customers = ::Customer.where(agent_affiliate_id: @current_agent.id).select(:id, :name, :email, :mobile, :created_at)
      render json: { registered_customers: customers }
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
      # customer = Customer.new(customer_params.merge(agent_affiliate: @current_agent))
      default_password = "1234"
      customer = Customer.new(customer_params)
      customer.update!(password: default_password, agent_affiliate_id: @current_agent.id)
      if customer.save
        # render json: { message: 'Customer registered successfully', customer: customer }, status: :created
        render json: { customer: customer.slice(:id, :name, :email, :photo_profile_url, :mobile) }, status: :created
      else
        render json: { errors: customer.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private
    
    def set_agent
      @agent = AgentAffiliate.find(params[:id])
    end

    def agent_affiliate_params
      params.require(:agent_affiliate).permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        :photo_profile_url,
        :mobile,
        :referral_code,
        :last_login_at,
        :full_name,
        :nik,
        :occupation,
        :age,
        :gender,
        :married_status,
        :education,
        :salary_range,
        :address,
        :emergency_email,
        :emergency_mobile_number,
        :emergency_address,
        :bank,
        :bank_branch,
        :account_number,
        :account_name,
        :agent_affiliate_id
      )
    end

    # def agent_affiliate_params
    #   params.require(:agent_affiliate).permit(:name, :email, :password, :password_confirmation, 
    #     :photo_profile_url, :mobile, :referral_code, :nik, :occupation, :age, :gender, 
    #     :married_status, :education, :salary_range, :address, :emergency_email, 
    #     :emergency_mobile_number, :emergency_address)
    # end

    def send_whatsapp_notification(agent)
      WatiService.send_message(agent)
    end

    # def customer_params
    #   params.require(:customer).permit(:name, :email, :username, :mobile, :referral_code, :visit_id, 
    #     :kpr_document_id, :villa_unit_id, :last_login_at, :villa_rent_id, :package_id, 
    #     :is_buyer, :is_renter, :is_package, :is_package_buyer, :password, :password_digest, 
    #     :photo_profile_url, :customer_address_id, :password_confirmation, :birthday, :gender, 
    #     :nik, :roles, :is_deleted)
    # end

    def customer_params
      params.require(:customer).permit(
        :name,
        :username,
        :email,
        :mobile,
        :referral_code,   # Parameter referral code dikirim oleh customer
        :visit_id,
        :kpr_document_id,
        :villa_unit_id,
        :is_buyer,
        :is_renter,
        :is_package_buyer,
        :last_login_at,
        :villa_rent_id,
        :package_id,
        :password,
        :password_confirmation,
        :photo_profil_url,
        :fullName,
        :nik,
        :occupation,
        :age,
        :gender,
        :married_status,
        :education,
        :salary_range,
        :address,
        :emergency_email,
        :emergency_mobile_number,
        :emergency_address,
        # Field agent_affiliate_id tidak perlu diizinkan melalui form sign up
      )
    end

    def authenticate_agent
      header = request.headers['Authorization']
      token = header.split(' ').last if header

      begin
        decoded = JsonWebToken.decode(token)
        @current_agent = AgentAffiliate.find(decoded[:agent_id])
      rescue ActiveRecord::RecordNotFound, JWT::DecodeError
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end
  
  end
end