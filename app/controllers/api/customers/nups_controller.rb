module Api
  module Customers
  class nupssController < ApplicationController
    # Private Endpoint
    
    # POST /nups
    def create
        nup_params = create_request

        if Customer.find_by(email: nup_params[:email])
        render json: { error: "This Customer already exists" }, status: :bad_request
        else
        customer = Customer.create!(nup_params)
        render json: customer, status: :ok
        end
    end

    private

    def create_request
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
