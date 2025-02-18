module Api
  module Admin
    class AgentAffiliatesController < ApplicationController
      before_action :set_agent, only: [:show, :commissions, :rewards, :withdraws]

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

      private

      def set_agent
        @agent = AgentAffiliate.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Agent Affiliate not found' }, status: :not_found
      end
    end
  end
end