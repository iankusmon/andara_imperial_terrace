module Api
  module Customers
  class DownPaymentsController < ApplicationController
    # Private Endpoint
    
    # POST /down_payments
    def create
        down_payment_params = create_request

        if DownPayment.find_by(down_payment_number: down_payment_params[:down_payment_number])
        render json: { error: "This DownPayment already exists" }, status: :bad_request
        else
        down_payment = DownPayment.create!(down_payment_params)
        render json: down_payment, status: :ok
        end
    end

    private

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
              :villa_desired,
              :payment_receipt_url,
              :note
        )
    end
          
  end
end
end
