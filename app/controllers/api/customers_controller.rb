module Api
  class CustomersController < ApplicationController
    before_action :set_customer, only: [:buy_villa]

    # Private Endpoint
    # GET /customers
    def index
        customers = Customer.all
        render json: customers, status: :ok
    end
    
    # GET /customers/:id
    def show
        customer = Customer.find_by(id: params[:id])

        if customer.nil?
        render json: { error: "Customer not found" }, status: :not_found
        else
        render json: customer, status: :ok
        end
    end
    
    # POST /api/customers => Customer Sign Up
    def create
      customer = Customer.new(customer_params)

      # Jika ada referral code, cari AgentAffiliate dan set agent_affiliate_id pada customer
      if params[:customer][:referral_code].present?
        agent = AgentAffiliate.find_by(referral_code: params[:customer][:referral_code])
        if agent
          customer.agent_affiliate_id = agent.id
        else
          # # Jika referral code tidak valid, kembalikan error
          # render json: { error: "Invalid referral code" }, status: :unprocessable_entity and return
          customer.agent_affiliate_id = 999999
        end
      # else
      #   # Jika referral code wajib untuk tracking, bisa mengembalikan error
      #   render json: { error: "Referral code is required" }, status: :unprocessable_entity and return
      end

      if customer.save
        token = CustomerJsonWebToken.encode({ customer_id: customer.id })
        render json: { token: token, customer: customer.slice(:id, :name, :email, :photo_profile_url, :mobile) }, status: :created
      else
        render json: { errors: customer.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # POST /api/customers/login => Customer Login (JWT khusus customer)
    def login
      customer = Customer.find_by(email: params[:email])
      if customer && customer.authenticate(params[:password])
        token = CustomerJsonWebToken.encode({ customer_id: customer.id })
        render json: { token: token, customer: customer }, status: :ok
      else
        render json: { error: "Invalid email or password" }, status: :unauthorized
      end
    end

    # POST /api/customers/:id/buy_villa
    # Params: villa_unit_id, step, (dp_amount, kpr_document_id, villa_rent_id, etc. sesuai tahap)
    def buy_villa
      customer = @customer
      villa = VillaUnit.find(params[:villa_unit_id])
      step = params[:step]

      case step
      when "nup"
        if customer.update(is_buyer: true, villa_unit_id: villa.id)
          # Withdraw I: Rp 100.000
          create_revenue_for_agent(customer.agent_affiliate_id, 100_000, "NUP")
          render json: { message: "NUP process completed", customer: customer }, status: :ok
        else
          render json: { errors: customer.errors.full_messages }, status: :unprocessable_entity
        end

      when "booking_fee"
        if customer.update(villa_unit_id: params[:villa_unit_id])
          # Withdraw II: Rp 1.000.000
          create_revenue_for_agent(customer.agent_affiliate_id, 1_000_000, "Booking Fee")
          render json: { message: "Booking fee process completed", customer: customer }, status: :ok
        else
          render json: { errors: customer.errors.full_messages }, status: :unprocessable_entity
        end

      when "dp_10"
        dp_amount = params[:dp_amount].to_f
        if dp_amount >= villa.price * 0.10 && dp_amount < villa.price * 0.20
          customer.update(kpr_document_id: params[:kpr_document_id])
          # Withdraw III: Rp 5.000.000
          create_revenue_for_agent(customer.agent_affiliate_id, 5_000_000, "DP 10%")
          render json: { message: "Down Payment 10% process completed", customer: customer }, status: :ok
        else
          render json: { error: "Invalid Down Payment amount for 10%" }, status: :unprocessable_entity
        end

      when "dp_20"
        dp_amount = params[:dp_amount].to_f
        if dp_amount >= villa.price * 0.20 && dp_amount < villa.price * 0.30
          customer.update(kpr_document_id: params[:kpr_document_id])
          # Withdraw IV: Rp 10.000.000
          create_revenue_for_agent(customer.agent_affiliate_id, 10_000_000, "DP 20%")
          render json: { message: "Down Payment 20% process completed", customer: customer }, status: :ok
        else
          render json: { error: "Invalid Down Payment amount for 20%" }, status: :unprocessable_entity
        end

      when "dp_30"
        dp_amount = params[:dp_amount].to_f
        if dp_amount >= villa.price * 0.30
          customer.update(kpr_document_id: params[:kpr_document_id])
          # Withdraw V: Rp 36.700.000
          create_revenue_for_agent(customer.agent_affiliate_id, 36_700_000, "DP 30% - Full Commission")
          render json: { message: "Down Payment 30% process completed, full commission triggered", customer: customer }, status: :ok
        else
          render json: { error: "Down Payment must be at least 30% for full commission" }, status: :unprocessable_entity
        end

      when "pelunasan"
        if customer.update(is_package_buyer: true)
          render json: { message: "Pelunasan completed", customer: customer }, status: :ok
        else
          render json: { errors: customer.errors.full_messages }, status: :unprocessable_entity
        end

      else
        render json: { error: "Invalid step parameter" }, status: :bad_request
      end
    end
    
    # PUT /customers/:id
    def update
        customer = Customer.find_by(id: params[:id])
        update_params = update_request


        if customer.nil?
        render json: { error: "Customer not found" }, status: :not_found
        else
        customer.update!(update_params)
        render json: customer, status: :ok
        end
    end

    private

    def set_customer
      @customer = Customer.find(params[:id])
    end

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

    def create_revenue_for_agent(agent_affiliate_id, amount, description)
      return unless agent_affiliate_id.present?
      agent = AgentAffiliate.find(agent_affiliate_id)
      AgentAffiliateRevenue.create!(
        agent_affiliate: agent,
        name: "Komisi Penjualan - #{description}",
        percentage: 2, # Komisi 2%
        fixed: amount,
        month: Time.now.strftime("%m"),
        year: Time.now.strftime("%Y"),
        bank_account_number: agent.account_number,
        bank_account_name: agent.account_name,
        bank_name: agent.bank,
        bank_branch_name: agent.bank_branch
      )
    end

    def update_request
        params.require(:customer).permit(
            :name, 
            :email, 
            :username, 
            :mobile, 
            :referreral_code, 
            :visit_id, 
            :kpr_document_id, 
            :villa_unit_id, 
            :last_login_at, 
            :villa_rent_id, 
            :package_id, 
            :created_at, 
            :updated_at, 
            :is_buyer, 
            :is_renter, 
            :is_package, 
            :is_package_buyer, 
            :password, 
            :password_digest, 
            :photo_profile_url, 
            :customer_address_id
        )
    end
          
  end
end
