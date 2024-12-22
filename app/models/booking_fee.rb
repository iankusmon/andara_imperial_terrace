class BookingFee < ApplicationRecord

  # Enumerations
  enum :occupation, {
    karyawan:  0,
    wirausaha: 1,
    pns:       2
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

  enum :payment_type, {
    cash_keras:  0,
    cash_tempo: 1,
    kpr: 2
  }

  enum :cash_tempo_period, {
    three_month:  0,
    six_months: 1,
    twelve_months: 2
  }
  
end
