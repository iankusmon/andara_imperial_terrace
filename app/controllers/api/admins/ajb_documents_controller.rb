module Api
  module Admins
    class AjbDocumentsController < ApplicationController
      # Private Endpoint
      # GET /admins/ajbs
      def index
          filter_params = index_request
          ajbs = AjbDocument.all
          ajbs = ajbs.where('ajb_number LIKE ?', "%#{filter_params[:ajb_number]}%") if filter_params[:ajb_number].present?
          ajbs = ajbs.where('order_number LIKE ?', "%#{filter_params[:order_number]}%") if filter_params[:order_number].present?
          ajbs = ajbs.where('fullname LIKE ?', "%#{filter_params[:fullname]}%") if filter_params[:fullname].present?
          ajbs = ajbs.where('nik LIKE ?', "%#{filter_params[:nik]}%") if filter_params[:nik].present?
          render(
            json: ajbs,
            root: :ajbs,
            each_serializer: ::AjbDocumentSerializer
          )
      end
      
      # GET /admins/ajbs/:id
      def show
          ajb = AjbDocument.find_by(id: params[:id])

          if ajb.nil?
          render json: { error: "AjbDocument not found" }, status: :not_found
          else
          render json: ajb, status: :ok
          end
      end
      
      # POST /admins/ajbs
      def create
          ajb_params = create_request

          # Check whether ajb already exist, by checking unique ajb number
          if AjbDocument.find_by(ajb_number: ajb_params[:ajb_number])
          render json: { error: "This AjbDocument already exists" }, status: :bad_request
          else
          ajb = AjbDocument.create!(ajb_params)
          render json: ajb, status: :ok
          end
      end
      
      # PUT /admins/ajbs/:id
      def update
          ajb = AjbDocument.find_by(id: params[:id])
          update_params = update_request

          # Check whether ajb exist
          if ajb.nil?
          render json: { error: "AjbDocument not found" }, status: :not_found
          else
          ajb.update!(update_params)
          render json: ajb, status: :ok
          end
      end

      private

      def index_request
        params.permit(
              :ajb_number,
              :order_number,
              :fullname,
              :nik,
              :villa_booked_unit,
              :villa_booked_cluster,
              :villa_booked_street
          )
      end

      def create_request
          params.require(:ajb).permit(
                :ajb_number,
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

      def update_request
          params.require(:ajb).permit(
                :ajb_number,
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
