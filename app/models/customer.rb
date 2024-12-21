class Customer < ApplicationRecord
    #Enum
    enum :roles, { 
        customer: 0, 
        agen_affiliate: 1 
    }
    # Associations
    has_many :villa_units
    has_many :villa_rent_units
    has_many :visit_records
    has_many :customer_adddresses
    has_many :packages
    has_many :kpr_documents
end
