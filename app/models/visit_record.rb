class VisitRecord < ApplicationRecord

    has_one :share_social_media
    # Enumeration
    enum :page, {
        landing_page: 0, 
        detail: 1, 
        rent: 2, 
        tour: 3, 
        artikel: 4
    }

end