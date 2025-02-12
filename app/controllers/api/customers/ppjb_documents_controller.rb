module Api
  module Customers
  class PpjbDocumentsController < ApplicationController
    # Private Endpoint
    
    # POST /ppjbs
    def create
        ppjb_params = create_request

        if Ppjb.find_by(ppjb_number: ppjb_params[:ppjb_number])
        render json: { error: "This Ppjb already exists" }, status: :bad_request
        else
        ppjb = Ppjb.create!(ppjb_params)
        render json: ppjb, status: :ok
        end
    end

    private

    def create_request
        params.require(:ppjb).permit(
              :ppjb_number,
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