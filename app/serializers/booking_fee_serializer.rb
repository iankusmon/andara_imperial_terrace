class BookingFeeSerializer < ActiveModel::Serializer
  attributes  :id,
              :booking_fee_number,
              :order_number,
              :payment_type,
              :payment_method,
              :cash_tempo_period,
              :fullname,
              :nik,
              :occupation,
              :payment_receipt_url,
              :note,
              :scan_ktp_url,
              :scan_kk_url,
              :scan_npwp_url,
              :scan_buku_nikah_url,
              :scan_last_3_months_slip_gaji_url,
              :scan_last_3_months_rekening_koran_url,
              :scan_sk_pekerjaan_url,
              :scan_fc_legal_usaha_url,
              :scan_laporan_keuangan_url,
              :scan_last_3_months_rekening_koran_usaha_url
end