class AjbDocument < ApplicationRecord
  has_one_attached :file

  # Enumerations
  enum :status, {
    pending:  0,
    uploaded: 1,
    seen_by_customer: 2
  }
  
end
