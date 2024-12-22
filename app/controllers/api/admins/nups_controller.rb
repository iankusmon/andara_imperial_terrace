module Api
  module Admins
    class NupsController < ApplicationController
      # Private Endpoint
      # GET /admins/nups
      def index
          filter_params = index_request
          nups = Nup.all
          nups = nups.where('nup_number LIKE ?', "%#{filter_params[:nup_number]}%") if filter_params[:nup_number].present?
          nups = nups.where('order_number LIKE ?', "%#{filter_params[:order_number]}%") if filter_params[:order_number].present?
          nups = nups.where('fullname LIKE ?', "%#{filter_params[:fullname]}%") if filter_params[:fullname].present?
          nups = nups.where('nik LIKE ?', "%#{filter_params[:nik]}%") if filter_params[:nik].present?
          nups = nups.where("mobile LIKE ?", "%#{filter_params[:mobile]}%") if filter_params[:mobile].present?
          nups = nups.where(package: filter_params[:package]) if filter_params[:package].present?
          nups = nups.where(payment_method: filter_params[:payment_method]) if filter_params[:payment_method].present?
          nups = nups.where(status: filter_params[:status]) if filter_params[:status].present?
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

      def index_request
        params.permit(
              :nup_number,
              :order_number,
              :fullname,
              :nik,
              :package,
              :payment_method,
              :status
          )
      end

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

      def update_request
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
end
