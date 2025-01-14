module Api
  module Admins
    class KprsController < ApplicationController
      # Private Endpoint
      # GET /admins/kprs
      def index
          filter_params = index_request
          kprs = Kpr.all
          kprs = kprs.where('kpr_id LIKE ?', "%#{filter_params[:kpr_id]}%") if filter_params[:kpr_id].present?
          kprs = kprs.where('customer_id LIKE ?', "%#{filter_params[:customer_id]}%") if filter_params[:customer_id].present?
          kprs = kprs.where('customer_name LIKE ?', "%#{filter_params[:customer_name]}%") if filter_params[:customer_name].present?
          kprs = kprs.where('nik LIKE ?', "%#{filter_params[:nik]}%") if filter_params[:nik].present?
          kprs = kprs.where("mobile LIKE ?", "%#{filter_params[:mobile]}%") if filter_params[:mobile].present?
          kprs = kprs.where("kpr_number LIKE ?", "%#{filter_params[:kpr_number]}%") if filter_params[:kpr_number].present?
          kprs = kprs.where(booking_fee_status: filter_params[:booking_fee_status]) if filter_params[:booking_fee_status].present?
          kprs = kprs.where(down_payment_status: filter_params[:down_payment_status]) if filter_params[:down_payment_status].present?
          kprs = kprs.where(bank: filter_params[:bank]) if filter_params[:bank].present?
          kprs = kprs.where(submission_status: filter_params[:submission_status]) if filter_params[:submission_status].present?
          kprs = kprs.where(tenor_period: filter_params[:tenor_period]) if filter_params[:tenor_period].present?
          kprs = kprs.where(kpr_payment_status: filter_params[:kpr_payment_status]) if filter_params[:kpr_payment_status].present?
          render(
            json: kprs,
            root: :kprs,
            each_serializer: KprSerializer
          )
      end
      
      # GET /admins/kprs/:id
      def show
          kpr = Kpr.find_by(id: params[:id])

          if kpr.nil?
          render json: { error: "Kpr not found" }, status: :not_found
          else
          render json: kpr, status: :ok
          end
      end
      
      # POST /admins/kprs
      def create
          kpr_params = create_request

          # Check whether kpr already exist, by checking unique kpr number
          if Kpr.find_by(kpr_id: kpr_params[:kpr_id])
          render json: { error: "This KPR Data already exists" }, status: :bad_request
          else
          kpr = Kpr.create!(kpr_params)
          render json: kpr, status: :ok
          end
      end
      
      # PUT /admins/kprs/:id
      def update
          kpr = Kpr.find_by(id: params[:id])
          update_params = update_request

          # Check whether kpr exist
          if kpr.nil?
          render json: { error: "KPR Data not found" }, status: :not_found
          else
          kpr.update!(update_params)
          render json: kpr, status: :ok
          end
      end

      private

      def index_request
        params.permit(
              :kpr_id,
              :customer_id,
              :customer_name,
              :nik,
              :mobile,
              :nup_number,
              :booking_fee_status,
              :down_payment_status,
              :bank,
              :submission_status,
              :tenor_period,
              :kpr_payment_status
          )
      end

      def create_request
          params.require(:kpr).permit(
            :kpr_id,
            :customer_id,
            :customer_name,
            :nik,
            :mobile,
            :customer_address,
            :nup_number,
            :booking_fee_status,
            :url_spkb_document,
            :down_payment_status,
            :bank,
            :filing_date,
            :submission_status,
            :loan_amount,
            :tenor_period,
            :monthly_installments,
            :due_date,
            :note,
            :kpr_payment_status
          )
      end

      def update_request
          params.require(:kpr).permit(
            :kpr_id,
            :customer_id,
            :customer_name,
            :nik,
            :mobile,
            :customer_address,
            :nup_number,
            :booking_fee_status,
            :url_spkb_document,
            :down_payment_status,
            :bank,
            :filing_date,
            :submission_status,
            :loan_amount,
            :tenor_period,
            :monthly_installments,
            :due_date,
            :note,
            :kpr_payment_status
          )
      end    
    end
  end
end
