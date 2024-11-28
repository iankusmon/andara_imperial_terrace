class ShareSocialMedia < ApplicationRecord
    # Enumeration
    enum :name, {
        whatsapp: 0,
        facebook: 1,
        telegram: 2
    }
end