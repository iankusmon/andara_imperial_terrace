class CreateBookingFees < ActiveRecord::Migration[8.0]
  def up
    create_table :booking_fees do |t|
      t.integer :booking_fee_number
      t.integer :order_number
      t.integer :payment_type
      t.integer :payment_method
      t.integer :cash_tempo_period
      t.string  :fullname
      t.integer :nik
      t.integer :occupation
      t.string  :scan_ktp_url
      t.string  :scan_kk_url
      t.string  :scan_npwp_url
      t.string  :scan_buku_nikah_url
      t.string  :scan_last_3_months_slip_gaji_url
      t.string  :scan_last_3_months_rekening_koran_url
      t.string  :scan_sk_pekerjaan_url
      t.string  :scan_fc_legal_usaha_url
      t.string  :scan_laporan_keuangan_url
      t.string  :scan_last_3_months_rekening_koran_usaha_url
      t.string  :status
      t.string  :payment_receipt_url

      t.timestamps
    end
  end

  def down
    drop_table :booking_fees
  end
end
