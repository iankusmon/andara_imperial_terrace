module Api
  module Admins
    class PpjbDocumentsController < ApplicationController
      # Private Endpoint
      # GET /admins/ppjbs
      def index
          filter_params = index_request
          ppjb_documents = PpjbDocument.all
          ppjb_documents = ppjb_documents.where('ppjb_number LIKE ?', "%#{filter_params[:ppjb_number]}%") if filter_params[:ppjb_number].present?
          ppjb_documents = ppjb_documents.where('customer_id LIKE ?', "%#{filter_params[:customer_id]}%") if filter_params[:customer_id].present?
          ppjb_documents = ppjb_documents.where('customer_name LIKE ?', "%#{filter_params[:customer_name]}%") if filter_params[:customer_name].present?
          ppjb_documents = ppjb_documents.where('nik LIKE ?', "%#{filter_params[:nik]}%") if filter_params[:nik].present?
          ppjb_documents = ppjb_documents.where(villa_type: filter_params[:villa_type]) if filter_params[:villa_type].present?
          ppjb_documents = ppjb_documents.where(floor_type: filter_params[:floor_type]) if filter_params[:floor_type].present?
          ppjb_documents = ppjb_documents.where(down_payment_status: filter_params[:down_payment_status]) if filter_params[:down_payment_status].present?
          ppjb_documents = ppjb_documents.where(upload_status: filter_params[:upload_status]) if filter_params[:upload_status].present?
      
          render(
            json: ppjb_documents,
            root: :ppjb_documents,
            each_serializer: PpjbDocumentSerializer
          )
      end
      
      # GET /admins/ppjbs/:id
      def show
        ppjb_document = PpjbDocument.find_by(id: params[:id])

          if ppjb_document.nil?
          render json: { error: "PpjbDocument not found" }, status: :not_found
          else
          render json: ppjb_document, status: :ok
          end
      end
      
      # POST /admins/ppjbs
      def create
          ppjb_document_params = create_request

          # Check whether ppjb already exist, by checking unique ppjb number
          if PpjbDocument.find_by(ppjb_number: ppjb_document_params[:ppjb_number])
          render json: { error: "This PpjbDocument already exists" }, status: :bad_request
          else
            ppjb_document = PpjbDocument.create!(ppjb_document_params)
          render json: ppjb_document, status: :ok
          end
      end
      
      # PUT /admins/ppjbs/:id
      def update
        ppjb_document = PpjbDocument.find_by(id: params[:id])
          update_params = update_request

          if params[:document][:file] != "null"
            # Delete old attachment first
            old_ppjb_document = ActiveStorage::Blob.find_by(filename: "ppjb_document#{ppjb_document.id}")
            old_ppjb_document&.purge

            # Save to documents
            ppjb_document.document.attach(io: params[:document][:file], filename: "#{params[:document][:document_type]}_#{ppjb_document.id}", content_type: "docx/pdf")
            # params[:document][:file].rewind

            ppjb_document.save!
          end
          

          # Get url from document
          if ppjb_document.document.attached?
            ppjb_url = ::Rails.application.routes.url_helpers.rails_blob_path(ppjb_document.document, only_path: true)
          end

          # Save turl to ppjb_documents, by appending ppjb_url update_params 
          update_params[:upload_ppjb_doc] = ppjb_url

          # Check whether ppjb_document exist
          if ppjb_document.nil?
          render json: { error: "BookingFee not found" }, status: :not_found
          else
          ppjb_document.update!(update_params)
          render json: ppjb_document, status: :ok
          end
      end

      private

      def index_request
        params.permit(
            :ppjb_number,
            :customer_id,
            :customer_name,
            :nik,
            :villa_unit_type,
            :villa_floor_type,
            :down_payment_status,
            :upload_status
          )
      end

      def create_request
          params.require(:ppjb_document).permit(
            :ppjb_number,
            :customer_id,
            :customer_name,
            :nik,
            :mobile,
            :villa_unit_type,
            :villa_floor_type,
            :villa_price,
            :order_number,
            :down_payment_status,
            :down_payment_receipt_url,
            :upload_ppjb_doc,
            :upload_status
          )
      end

      def update_request
          params.require(:ppjb_document).permit(
            :ppjb_number,
            :customer_id,
            :customer_name,
            :nik,
            :mobile,
            :villa_unit_type,
            :villa_floor_type,
            :villa_price,
            :order_number,
            :down_payment_status,
            :down_payment_receipt_url,
            :upload_ppjb_doc,
            :upload_status
          )
      end
            
    end
  end
end
