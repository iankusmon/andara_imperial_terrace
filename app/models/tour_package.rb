class TourPackage < ApplicationRecord
    # Enumeration
    enum :payment_status, {
        pending: 0,
        in_progress: 1,
        paid: 2
    }
    enum :drop_point_status, {
        unpaid: 0,
        been_paid: 1
    }

    # Associations
    has_many :destinations
end
