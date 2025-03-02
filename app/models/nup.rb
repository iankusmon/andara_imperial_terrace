class Nup < ApplicationRecord
  has_one_attached :scan_ktp
  has_one_attached :payment_receipt
  # before_create :set_nup_number
  # validate :validate_ktp_usage

  belongs_to :customer

  # Enumerations
  enum :occupation, {
    swasta: 0,
    pns:    1,
    wiraswasta: 2,
    lainnya: 3
  }

  enum :package, {
    ekslusif:  0,
    investasi: 1
  }

  enum :villa_desired, {
    da_vinci_residence:  0,
    amsterdam_royal: 1,
    athena_height: 2
  }

  enum :payment_method, {
    cash:     0,
    transfer: 1
  }

  enum :status, {
    pending:  0,
    approved: 1,
    rejected: 2
  }

  private

  # Set default NUP number berdasarkan jumlah data yang sudah ada +1
  def set_nup_number
    last_nup = Nup.order(:created_at).last
    next_number = last_nup ? last_nup.nup_number&.split("-").last.to_i + 1 : 1
    self.nup_number = format("NUP-%06d", next_number)
  end

  # Validasi maksimal 1 KTP untuk 5 NUP
  def validate_ktp_usage
    if Nup.where(scan_ktp_url: scan_ktp_url).count >= 5
      errors.add(:scan_ktp, "Maksimal 1 KTP hanya bisa digunakan untuk 5 NUP.")
    end
  end
  
end
