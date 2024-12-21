module Api
  module Admins
    class NupsController < ApplicationController
      # Private Endpoint
      # GET /admins/nups
      def index
          nups = Nup.all

          render(
            json: nups,
            root: :nups,
            each_serializer: NupSerializer
          )
      end
      
      # GET /admins/nups/:id
      def show
          nup = Nup.find_by(id: params[:id])

          if nup.nil?
          render json: { error: "Nup not found" }, status: :not_found
          else
          render json: nup, status: :ok
          end
      end
      
      # POST /admins/nups
      def create
          nup_params = create_request

          # Check whether nup already exist, by checking unique nup number
          if Nup.find_by(nup_number: nup_params[:nup_number])
          render json: { error: "This Nup already exists" }, status: :bad_request
          else
          nup = Nup.create!(nup_params)
          render json: nup, status: :ok
          end
      end
      
      # PUT /admins/nups/:id
      def update
          nup = Nup.find_by(id: params[:id])
          update_params = update_request

          # Check whether nup exist
          if nup.nil?
          render json: { error: "Nup not found" }, status: :not_found
          else
          nup.update!(update_params)
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
            :package,
            :villa_desired,
            :payment_method,
            :address
          )
      end

      def update_request
          params.require(:nup).permit(
            :nup_number,
            :order_number,
            :fullname,
            :nik,
            :occupation,
            :scan_ktp_url,
            :package,
            :villa_desired,
            :payment_method,
            :address
          )
      end
            
    end
  end
end
