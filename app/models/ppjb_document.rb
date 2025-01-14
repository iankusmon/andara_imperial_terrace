class PpjbDocument < ApplicationRecord
  has_one_attached :document

  # Enumerations
  enum :villa_unit_type, { 
    eiffel_type: 0, 
    venice_type: 1 
  }
  enum :villa_floor_type, { 
    second_floor: 0, 
    third_floor: 1,
  }
  enum :down_payment_status, { 
    pending: 0, 
    approved: 1, 
    rejected: 2 
  }
  enum :upload_status, { 
    unuploaded: 0, 
    uploaded: 1, 
    seen_by_customer: 2 
  }
  
end
