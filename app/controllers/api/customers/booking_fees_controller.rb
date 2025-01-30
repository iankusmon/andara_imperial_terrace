module Api
  module Customers
  class BookingFeesController < ApplicationController
    # Private Endpoint
    
    # POST /booking_fees
    def create
        booking_fee_params = create_request

        if BookingFee.find_by(booking_fee_number: booking_fee_params[:booking_fee_number])
        render json: { error: "This BookingFee already exists" }, status: :bad_request
        else
        booking_fee = BookingFee.create!(booking_fee_params)
        render json: booking_fee, status: :ok
        end
    end

    private

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
              :payment_receipt_url,
              :scan_ktp_url,
              :scan_kk_url,
              :scan_npwp_url,
              :scan_buku_nikah_url,
              :scan_last_3_months_slip_gaji_url,
              :scan_last_3_months_rekening_koran_url,
              :scan_sk_pekerjaan_url,
              :scan_fc_legal_usaha_url,
              :scan_laporan_keuangan_url,
              :scan_last_6_months_rekening_koran_usaha_url
        )
    end
          
  end
end
