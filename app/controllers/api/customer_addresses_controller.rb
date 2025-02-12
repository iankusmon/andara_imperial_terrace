module Api
  class CustomerAddressesController < ApplicationController
    # Private Endpoint
    # GET /customer_addresses
    def index
        customer_addresses = CustomerAddress.all
        render json: customer_addresses, status: :ok
    end
    # GET /customer_addresses/:id
    def show
        customer_address = CustomerAddress.find_by(id: params[:id])
        
        if customer_address.nil?
        render json: { error: "Customer address not found" }, status: :not_found
        else
        render json: customer_address, status: :ok
        end
    end
    # POST /customer_addresses
    def create
        customer_address = CustomerAddress.new(create_request)

        if customer_address.save
            render json: customer_address, status: :created
        else
            render json: { error: customer_address.errors.full_messages }, status: :unprocessable_entity
        end
    end
    # PUT /customer_addresses/:id
    def update
        customer_address = CustomerAddress.find_by(id: params[:id])

            if customer_address.nil?
                render json: { error: "Customer address not found" }, status: :not_found
            else
            if customer_address.update(update_request)
                render json: customer_address, status: :ok
            else
                render json: { error: customer_address.errors.full_messages }, status: :unprocessable_entity
            end
        end
    end

    private

    def create_request
        params.require(:customer).permit(
            :label, 
            :receiver_name, 
            :receiver_mobile, 
            :provinsi, 
            :kota, 
            :kecamatan, 
            :street_address, 
            :kode_pos, 
            :address_note, 
            :latitude => precision: 10, scale: 6, 
            :longitude => precision: 10, scale: 6
        )
    end

    def update_request
        params.require(:customer).permit(
            :label, 
            :receiver_name, 
            :receiver_mobile, 
            :provinsi, 
            :kota, 
            :kecamatan, 
            :street_address, 
            :kode_pos, 
            :address_note, 
            :latitude => precision: 10, scale: 6, 
            :longitude => precision: 10, scale: 6
        )
    end
  end
end

