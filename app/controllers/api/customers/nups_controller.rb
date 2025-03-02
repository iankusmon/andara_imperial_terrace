module Api
  module Customers
  class NupsController < ApplicationController
    # Private Endpoint
    
    # POST /nups
    def create
      customer = Customer.find_by(id: params[:nup][:customer_id])
  
      unless customer
        render json: { error: "Customer not found" }, status: :unprocessable_entity
        return
      end
  
      nup = customer.nups.new(create_request)
  
      # Attach file jika ada
      nup.scan_ktp.attach(params[:nup][:scan_ktp]) if params[:nup][:scan_ktp].present?
      nup.payment_receipt.attach(params[:nup][:payment_receipt]) if params[:nup][:payment_receipt].present?
  
      if nup.save
        render json: { message: "NUP created successfully", nup: nup }, status: :ok
      else
        render json: { error: nup.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def create_request
      params.require(:nup).permit(
        :customer_id,
        :nup_number,
        :order_number,
        :fullname,
        :nik,
        :occupation,
        :package,
        :villa_desired,
        :villa_unit_desired,
        :payment_method,
        :address,
        :status,
        :income,
        :npwp,
        :phone,
        :email,
        :bank_name,
        :account_holder,
        :account_number,
        :scan_ktp,
        :payment_receipt
      )
    end
          
  end
end
end
