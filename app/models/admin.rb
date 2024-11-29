class Admin < ApplicationRecord

    has_secure_password

    enum :roles, { property: 0, tender: 1, penyewaan: 2, package: 3, kpr: 4 }
end
