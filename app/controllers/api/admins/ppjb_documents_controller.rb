module Api
  module Admins
    class PpjbDocumentsController < ApplicationController
      # Private Endpoint
      # GET /admins/ppjbs
      def index
          filter_params = index_request
          ppjbs = PpjbDocument.all
          ppjbs = ppjbs.where('ppjb_number LIKE ?', "%#{filter_params[:ppjb_number]}%") if filter_params[:ppjb_number].present?
          ppjbs = ppjbs.where('order_number LIKE ?', "%#{filter_params[:order_number]}%") if filter_params[:order_number].present?
          ppjbs = ppjbs.where('fullname LIKE ?', "%#{filter_params[:fullname]}%") if filter_params[:fullname].present?
          ppjbs = ppjbs.where('nik LIKE ?', "%#{filter_params[:nik]}%") if filter_params[:nik].present?
          render(
            json: ppjbs,
            root: :ppjbs,
            each_serializer: PpjbDocumentSerializer
          )
      end
      
      # GET /admins/ppjbs/:id
      def show
          ppjb = PpjbDocument.find_by(id: params[:id])

          if ppjb.nil?
          render json: { error: "PpjbDocument not found" }, status: :not_found
          else
          render json: ppjb, status: :ok
          end
      end
      
      # POST /admins/ppjbs
      def create
          ppjb_params = create_request

          # Check whether ppjb already exist, by checking unique ppjb number
          if PpjbDocument.find_by(ppjb_number: ppjb_params[:ppjb_number])
          render json: { error: "This PpjbDocument already exists" }, status: :bad_request
          else
          ppjb = PpjbDocument.create!(ppjb_params)
          render json: ppjb, status: :ok
          end
      end
      
      # PUT /admins/ppjbs/:id
      def update
          ppjb = PpjbDocument.find_by(id: params[:id])
          update_params = update_request

          # Check whether ppjb exist
          if ppjb.nil?
          render json: { error: "PpjbDocument not found" }, status: :not_found
          else
          ppjb.update!(update_params)
          render json: ppjb, status: :ok
          end
      end

      private

      def index_request
        params.permit(
              :ppjb_number,
              :order_number,
              :fullname,
              :nik,
              :villa_booked_unit,
              :villa_booked_cluster,
              :villa_booked_street
          )
      end

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
                :scan_ppjb_document,
                :file
          )
      end

      def update_request
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
                :scan_ppjb_document,
                :file
          )
      end
            
    end
  end
end
