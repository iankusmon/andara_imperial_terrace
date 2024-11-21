class HouseRentUnit < ApplicationRecord
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
   enum :catalog_type, {
    casa_versailes: 0,
    villa_parisian: 1,
    venetian_palace: 2,
    florence_mansion: 3
   }
   enum :cluster_type, {
    eiffel: 0,
    venice: 1
   }
   enum :avaibility_status, {
    available: 0,
    sold: 1
   }
end
