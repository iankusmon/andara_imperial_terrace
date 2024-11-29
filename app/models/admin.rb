class Admin < ApplicationRecord

    has_secure_password

    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    enum :roles, {
        property: 0, 
        tender: 1, 
        penyewaan: 2, 
        package: 3, 
        kpr: 4, 
        super_admin: 5
    }
end
