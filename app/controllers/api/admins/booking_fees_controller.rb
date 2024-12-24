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
            :scan_last_3_months_rekening_koran_usaha_url,
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
            :scan_last_3_months_rekening_koran_usaha_url,
            :payment_receipt_url,
            :kpr_tenor_period,
            :note,
            :status
          )
      end
            
    end
  end
end
