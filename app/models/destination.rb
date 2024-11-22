class Destination < ApplicationRecord
    # Enumeration
    enum :is_active, {
        not_active: 0,
        active: 1
    }

    # Associations
    belongs_to :tour_package
end
