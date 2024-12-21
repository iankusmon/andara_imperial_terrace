class Nup < ApplicationRecord

  # Enumerations
  enum :occupation, {
    karyawan:  0,
    wirausaha: 1,
    pns:       2
  }

  enum :package, {
    ekslusif:  0,
    investasi: 1
  }

  enum :villa_desired, {
    eiffel:  0,
    venice: 1
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
  
end
