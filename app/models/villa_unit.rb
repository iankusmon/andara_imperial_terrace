class VillaUnit < ApplicationRecord

    self.inheritance_column = nil
    # Enumerations
    enum :payment_status, { pending: 0, approved: 1, in_progress: 2 }
    enum :drop_point_status, { unpaid: 0, paid: 1 }
    enum :booking_fee_status, { not_paid: 0, been_paid: 1 }
    enum :type, { villa_eiffel: 0, villa_venice: 1 }
    enum :availability_status, { sold: 0, available: 1 }
end
