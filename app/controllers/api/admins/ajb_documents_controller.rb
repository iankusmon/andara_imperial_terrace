module Api
  module Admins
    class AjbDocumentsController < ApplicationController
      # Private Endpoint
      # GET /admins/ajbs
      def index
        filter_params = index_request
        ajb_documents = AjbDocument.all
        ajb_documents = ajb_documents.where('ajb_number LIKE ?', "%#{filter_params[:ajb_number]}%") if filter_params[:ajb_number].present?
        ajb_documents = ajb_documents.where('ppjb_number LIKE ?', "%#{filter_params[:ppjb_number]}%") if filter_params[:ppjb_number].present?
        ajb_documents = ajb_documents.where('customer_id LIKE ?', "%#{filter_params[:customer_id]}%") if filter_params[:customer_id].present?
        ajb_documents = ajb_documents.where('customer_name LIKE ?', "%#{filter_params[:customer_name]}%") if filter_params[:customer_name].present?
        ajb_documents = ajb_documents.where('nik LIKE ?', "%#{filter_params[:nik]}%") if filter_params[:nik].present?
        ajb_documents = ajb_documents.where(villa_type: filter_params[:villa_type]) if filter_params[:villa_type].present?
        ajb_documents = ajb_documents.where(floor_type: filter_params[:floor_type]) if filter_params[:floor_type].present?
        ajb_documents = ajb_documents.where(booking_fee_status: filter_params[:booking_fee_status]) if filter_params[:booking_fee_status].present?
        ajb_documents = ajb_documents.where(down_payment_status: filter_params[:down_payment_status]) if filter_params[:down_payment_status].present?
        ajb_documents = ajb_documents.where(payment_type: filter_params[:payment_type]) if filter_params[:payment_type].present?
        ajb_documents = ajb_documents.where(payment_type_status: filter_params[:payment_type_status]) if filter_params[:payment_type_status].present?
        ajb_documents = ajb_documents.where(ajb_upload_status: filter_params[:ajb_upload_status]) if filter_params[:ajb_upload_status].present?
    
        render(
          json: ajb_documents,
          root: :ajb_documents,
          each_serializer: AjbDocumentSerializer
        )
    end
      
      # GET /admins/ajbs/:id
      def show
          ajb_document = AjbDocument.find_by(id: params[:id])

          if ajb_document.nil?
          render json: { error: "AjbDocument not found" }, status: :not_found
          else
          render json: ajb_document, status: :ok
          end
      end
      
      # POST /admins/ajbs
      def create
          ajb_document_params = create_request

          # Check whether ajb already exist, by checking unique ajb number
          if AjbDocument.find_by(ajb_number: ajb_document_params[:ajb_number])
          render json: { error: "This AjbDocument already exists" }, status: :bad_request
          else
          ajb_document_params = AjbDocument.create!(ajb_document_params)
          render json: ajb_document_params, status: :ok
          end
      end
      
      # PUT /admins/ajbs/:id
      def update
        ajb_document = AjbDocument.find_by(id: params[:id])
          update_params = update_request

          if params[:document][:file] != "null"
            # Delete old attachment first
            old_ajb_document = ActiveStorage::Blob.find_by(filename: "ajb_document#{ajb_document.id}")
            old_ajb_document&.purge

            # Save to documents
            ajb_document.document.attach(io: params[:document][:file], filename: "#{params[:document][:document_type]}_#{ajb_document.id}", content_type: "docx/pdf")
            # params[:document][:file].rewind

            ajb_document.save!
          end
          

          # Get url from document
          if ajb_document.document.attached?
            ajb_url = ::Rails.application.routes.url_helpers.rails_blob_path(ajb_document.document, only_path: true)
          end

          # Save turl to ajb_documents, by appending ajb_url update_params 
          update_params[:upload_ajb_doc] = ajb_url

          # Check whether ajb_document exist
          if ajb_document.nil?
          render json: { error: "AJB Document not found" }, status: :not_found
          else
          ajb_document.update!(update_params)
          render json: ajb_document, status: :ok
          end
      end

      private

      def index_request
        params.permit(
            :ajb_number,
            :ppjb_number,
            :customer_id,
            :customer_name,
            :nik,
            :villa_unit_type,
            :villa_floor_type,
            :order_number,
            :booking_fee_status,
            :down_payment_status,
            :payment_type,
            :payment_type_status,
            :upload_ajb_doc,
            :ajb_upload_status
          )
      end

      def create_request
          params.require(:ajb_document).permit(
            :ajb_number,
            :ppjb_number,
            :customer_id,
            :customer_name,
            :nik,
            :mobile,
            :villa_unit_type,
            :villa_floor_type,
            :villa_price,
            :order_number,
            :booking_fee_status,
            :booking_fee_receipt_url,
            :down_payment_status,
            :down_payment_receipt_url,
            :payment_type,
            :payment_type_status,
            :upload_ajb_doc,
            :ajb_upload_status
          )
      end

      def update_request
          params.require(:ajb_document).permit(
            :ajb_number,
            :ppjb_number,
            :customer_id,
            :customer_name,
            :nik,
            :mobile,
            :villa_unit_type,
            :villa_floor_type,
            :villa_price,
            :order_number,
            :booking_fee_status,
            :booking_fee_receipt_url,
            :down_payment_status,
            :down_payment_receipt_url,
            :payment_type,
            :payment_type_status,
            :upload_ajb_doc,
            :ajb_upload_status
          )
      end
            
    end
  end
end
