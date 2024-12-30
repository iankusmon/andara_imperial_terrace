module Api
  module Admins
    class BookingFeesController < ApplicationController
      # Private Endpoint
      # GET /admins/booking_fees
      def index
          filter_params = index_request
          booking_fees = BookingFee.all
          booking_fees = booking_fees.where('booking_fee_number LIKE ?', "%#{filter_params[:booking_fee_number]}%") if filter_params[:booking_fee_number].present?
          booking_fees = booking_fees.where('order_number LIKE ?', "%#{filter_params[:order_number]}%") if filter_params[:order_number].present?
          booking_fees = booking_fees.where('fullname LIKE ?', "%#{filter_params[:fullname]}%") if filter_params[:fullname].present?
          booking_fees = booking_fees.where('nik LIKE ?', "%#{filter_params[:nik]}%") if filter_params[:nik].present?
          booking_fees = booking_fees.where(payment_method: filter_params[:payment_method]) if filter_params[:payment_method].present?
          booking_fees = booking_fees.where(payment_type: filter_params[:payment_type]) if filter_params[:payment_type].present?
          render(
            json: booking_fees,
            root: :booking_fees,
            each_serializer: BookingFeeSerializer
          )
      end
      
      # GET /admins/booking_fees/:id
      def show
          booking_fee = BookingFee.find_by(id: params[:id])

          if booking_fee.nil?
          render json: { error: "BookingFee not found" }, status: :not_found
          else
          render json: booking_fee, status: :ok
          end
      end
      
      # POST /admins/booking_fees
      def create
          booking_fee_params = create_request

          # Check whether booking_fee already exist, by checking unique booking_fee number
          if BookingFee.find_by(booking_fee_number: booking_fee_params[:booking_fee_number])
          render json: { error: "This BookingFee already exists" }, status: :bad_request
          else
          booking_fee = BookingFee.create!(booking_fee_params)
          render json: booking_fee, status: :ok
          end
      end
      
      # PUT /admins/booking_fees/:id
      def update
          booking_fee = BookingFee.find_by(id: params[:id])
          update_params = update_request

          # Delete old attachement first, before attach new one
          attachment = ActiveStorage::Attachment.find_by(record_id: booking_fee.id)
          attachment.purge # or use purge_later

          # Create a blob before direct upload to generate a signed url
          blob = ActiveStorage::Blob.create_before_direct_upload!(
            filename: params[:document][:document_type],
            byte_size: 1000,
            checksum: '528c89c37b3a6f0bd34480000a56c372',
            content_type: 'document'
          )

          # Attach the blob to the project by creating the association in the database directly.
          ActiveStorage::Attachment.create(
              name: 'document',
              record_type: 'BookingFee',
              record_id: booking_fee.id,
              blob_id: blob.id
          )

          # Save ke documents
          # booking_fee.document.attach(params[:document])
          # booking_fee.save!
          # Get url from document
          if booking_fee.document.attached?
            spkb_url = ::Rails.application.routes.url_helpers.rails_blob_path(booking_fee.document, only_path: true)
          end

          # Save turl to booking_fees, by appending spkb_url update_params 

          update_params[:upload_spkb_doc] = spkb_url

          # Check whether booking_fee exist
          if booking_fee.nil?
          render json: { error: "BookingFee not found" }, status: :not_found
          else
          booking_fee.update!(update_params)
          render json: booking_fee, status: :ok
          end
      end

      private

      def index_request
        params.permit(
              :booking_fee_number,
              :order_number,
              :fullname,
              :nik,
              :payment_type,
              :payment_method,
              :cash_tempo_period,
              :status
          )
      end

      def create_request
          params.require(:booking_fee).permit(
            :booking_fee_number,
            :order_number,
            :payment_type,
            :payment_method,
            :cash_tempo_period,
            :fullname,
            :nik,
            :occupation,
            :scan_ktp_url,
            :scan_kk_url,
            :scan_npwp_url,
            :scan_buku_nikah_url,
            :scan_last_3_months_slip_gaji_url,
            :scan_last_3_months_rekening_koran_url,
            :scan_sk_pekerjaan_url,
            :scan_fc_legal_usaha_url,
            :scan_laporan_keuangan_url,
            :scan_last_6_months_rekening_koran_usaha_url,
            :payment_receipt_url,
            :kpr_tenor_period,
            :note,
            :status
          )
      end

      def update_request
          params.require(:booking_fee).permit(
            :booking_fee_number,
            :order_number,
            :payment_type,
            :payment_method,
            :cash_tempo_period,
            :fullname,
            :nik,
            :occupation,
            :scan_ktp_url,
            :scan_kk_url,
            :scan_npwp_url,
            :scan_buku_nikah_url,
            :scan_last_3_months_slip_gaji_url,
            :scan_last_3_months_rekening_koran_url,
            :scan_sk_pekerjaan_url,
            :scan_fc_legal_usaha_url,
            :scan_laporan_keuangan_url,
            :scan_last_6_months_rekening_koran_usaha_url,
            :payment_receipt_url,
            :kpr_tenor_period,
            :note,
            :status
          )
      end
            
    end
  end
end
