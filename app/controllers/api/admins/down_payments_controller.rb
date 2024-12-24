module Api
  module Admins
    class DownPaymentsController < ApplicationController
      # Private Endpoint
      # GET /admins/down_payments
      def index
          filter_params = index_request
          down_payments = DownPayment.all
          down_payments = down_payments.where('down_payment_number LIKE ?', "%#{filter_params[:down_payment_number]}%") if filter_params[:down_payment_number].present?
          down_payments = down_payments.where('order_number LIKE ?', "%#{filter_params[:order_number]}%") if filter_params[:order_number].present?
          down_payments = down_payments.where('fullname LIKE ?', "%#{filter_params[:fullname]}%") if filter_params[:fullname].present?
          down_payments = down_payments.where('nik LIKE ?', "%#{filter_params[:nik]}%") if filter_params[:nik].present?
          down_payments = down_payments.where(payment_method: filter_params[:payment_method]) if filter_params[:payment_method].present?
          down_payments = down_payments.where(payment_type: filter_params[:payment_type]) if filter_params[:payment_type].present?
          render(
            json: down_payments,
            root: :down_payments,
            each_serializer: DownPaymentSerializer
          )
      end
      
      # GET /admins/down_payments/:id
      def show
          down_payment = DownPayment.find_by(id: params[:id])

          if down_payment.nil?
          render json: { error: "DownPayment not found" }, status: :not_found
          else
          render json: down_payment, status: :ok
          end
      end
      
      # POST /admins/down_payments
      def create
          down_payment_params = create_request

          # Check whether down_payment already exist, by checking unique down_payment number
          if DownPayment.find_by(down_payment_number: down_payment_params[:down_payment_number])
          render json: { error: "This DownPayment already exists" }, status: :bad_request
          else
          down_payment = DownPayment.create!(down_payment_params)
          render json: down_payment, status: :ok
          end
      end
      
      # PUT /admins/down_payments/:id
      def update
          down_payment = DownPayment.find_by(id: params[:id])
          update_params = update_request

          # Check whether down_payment exist
          if down_payment.nil?
          render json: { error: "DownPayment not found" }, status: :not_found
          else
          down_payment.update!(update_params)
          render json: down_payment, status: :ok
          end
      end

      private

      def index_request
        params.permit(
              :down_payment_number,
              :order_number,
              :fullname,
              :nik,
              :payment_method,
              :payment_type,
              :status
          )
      end

      def create_request
          params.require(:down_payment).permit(
            :down_payment_number,
            :order_number,
            :payment_type,
            :payment_method,
            :payment_amount,
            :tempo_period,
            :fullname,
            :nik,
            :occupation,
            :status,
            :payment_receipt_url,
            :note,
            :status
          )
      end

      def update_request
          params.require(:down_payment).permit(
            :down_payment_number,
            :order_number,
            :payment_type,
            :payment_method,
            :payment_amount,
            :tempo_period,
            :fullname,
            :nik,
            :occupation,
            :status,
            :payment_receipt_url,
            :note,
            :status
          )
      end
            
    end
  end
end
