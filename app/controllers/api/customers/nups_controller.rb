module Api
  module Customers
  class nupssController < ApplicationController
    # Private Endpoint
    
    # POST /nups
    def create
        nup_params = create_request

        if Nup.find_by(nup_number: nup_params[:nup_number])
        render json: { error: "This Nup already exists" }, status: :bad_request
        else
        nup = Nup.create!(nup_params)
        render json: nup, status: :ok
        end
    end

    private

    def create_request
        params.require(:nup).permit(
          :nup_number,
          :order_number,
          :fullname,
          :nik,
          :occupation,
          :scan_ktp_url,
          :payment_receipt_url,
          :package,
          :villa_desired,
          :payment_method,
          :address,
          :status
        )
    end
          
  end
end
