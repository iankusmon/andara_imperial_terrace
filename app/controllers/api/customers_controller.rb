module Api
  class CustomersController < ApplicationController
    # Private Endpoint
    # GET /customers
    def index
        customers = Customer.all
        render json: customers, status: :ok
    end
    
    # GET /customers/:id
    def show
        customer = Customer.find_by(id: params[:id])

        if customer.nil?
        render json: { error: "Customer not found" }, status: :not_found
        else
        render json: customer, status: :ok
        end
    end
    
    # POST /customers
    def create
        customer_params = create_request

        if Customer.find_by(email: customer_params[:email])
        render json: { error: "This Customer already exists" }, status: :bad_request
        else
        customer = Customer.create!(customer_params)
        render json: customer, status: :ok
        end
    end
    
    # PUT /customers/:id
    def update
        customer = Customer.find_by(id: params[:id])
        update_params = update_request


        if customer.nil?
        render json: { error: "Customer not found" }, status: :not_found
        else
        customer.update!(update_params)
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

    def update_request
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
