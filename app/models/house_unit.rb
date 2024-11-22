class HouseUnit < ApplicationRecord
    # Enumerations
    enum :payment_status, { pending: 0, approved: 1, in_progress: 2 }
    enum :drop_point_status, { unpaid: 0, paid: 1 }
    enum :booking_fee_status, { not_paid: 0, been_paid: 1 }
    enum :catalog_type, { 
        casa_versailles: 0, 
        villa_parisian: 1, 
        venetian_palace: 2, 
        florence_mansion: 3 
    }
    enum :cluster_type, { eiffel: 0, venice: 1 }
    enum :availability_status, { sold: 0, available: 1 }
end
