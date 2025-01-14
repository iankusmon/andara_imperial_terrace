class Buyer < ApplicationRecord
  
  enum :payment_type,{
    cash_keras: 0,
    cash_tempo: 1,
    kpr: 2
  }

  enum :payment_method,{
    cash: 0,
    transfer: 1
  }
end