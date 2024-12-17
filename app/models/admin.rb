class Admin < ApplicationRecord
    has_secure_password

    # Generate a new auth token
    def generate_auth_token
        update(auth_token: SecureRandom.hex(20))
    end

    # Check if admin has a specific role
    def super_admin?
        roles.include?('super_admin')
    end

    enum :roles, {
        property: 0, 
        tender: 1, 
        penyewaan: 2, 
        package: 3, 
        kpr: 4, 
        super_admin: 5
    }
end
