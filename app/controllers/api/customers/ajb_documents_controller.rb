module Api
  module Customers
  class AjbDocumentsController < ApplicationController
      # Private Endpoint
      
      # POST /ajbs
      def create
          ajb_params = create_request

          if Ajb.find_by(ajb_number: ajb_params[:ajb_number])
          render json: { error: "This Ajb already exists" }, status: :bad_request
          else
          ajb = Ajb.create!(ajb_params)
          render json: ajb, status: :ok
          end
      end

      private

      def create_request
          params.require(:ajb).permit(
                :ajb_number,
                :booking_fee_number,
                :down_payment_number,
                :order_number,
                :payment_type,
                :payment_method,
                :cash_tempo_period,
                :fullname,
                :nik,
                :occupation,
                :status,
                :documentation_photo,
                :scan_ppjb_document,
                :file
          )
      end
      
    end        
  end
end
