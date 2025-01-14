class Kpr < ApplicationRecord
    # Enumeration
    enum :booking_fee_status, {
      not_paid: 0,
      paid: 1
    }

    enum :down_payment_status, {
      unpaid: 0,
      done_paid: 1
    }

    enum :bank, {
      bni: 0,
      bca: 1,
      bri: 2,
      mandiri: 3,
      btn: 4,
      ocbc_nisp: 5,
      bsi: 6,
      danamon_syariah: 7,
      cimb_niaga: 8
    }

    enum :submission_status, {
      rejected: 0,
      approved: 1
    }

    enum :tenor_period, {
      ten_years: 0,
      fifteen_years: 1,
      twenty_years: 2
    }

    enum :kpr_payment_status, {
      unfinished: 0,
      finished: 1
    }
end