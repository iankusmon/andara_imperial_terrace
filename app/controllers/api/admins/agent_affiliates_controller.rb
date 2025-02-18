module Api
  module Admins
    class AgentAffiliatesController < ApplicationController
      before_action :set_agent, only: [:show, :commissions, :rewards, :withdraws, :register_customer, :upload_withdraw_proof]

      # GET /api/admin/agent_affiliates
      def index
        agents = AgentAffiliate.all
        render json: { agents: agents }, status: :ok
      end

      # GET /api/admin/agent_affiliates/:id
      def show
        render json: { agent: @agent }, status: :ok
      end

      # GET /api/admin/agent_affiliates/:id/commissions
      def commissions
        commissions = @agent.agent_affiliate_commissions
        render json: { commissions: commissions }, status: :ok
      end

      # GET /api/admin/agent_affiliates/:id/rewards
      def rewards
        rewards = @agent.agent_affiliate_rewards
        render json: { rewards: rewards }, status: :ok
      end

      # GET /api/admin/agent_affiliates/:id/withdraws (Revenues history)
      def withdraws
        revenues = @agent.agent_affiliate_revenues
        render json: { revenues: revenues }, status: :ok
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

      # POST /api/admin/agent_affiliates/:id/upload_withdraw_proof
      def upload_withdraw_proof
        if params[:proof].present?
          @agent.update(withdraw_proof: params[:proof])
          render json: { message: 'Withdraw proof uploaded successfully' }, status: :ok
        else
          render json: { error: 'No proof uploaded' }, status: :unprocessable_entity
        end
      end

      private

      def set_agent
        @agent = AgentAffiliate.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Agent Affiliate not found' }, status: :not_found
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
end