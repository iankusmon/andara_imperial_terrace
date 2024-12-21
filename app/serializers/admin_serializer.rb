# == Schema Information
#
# Table name: admins
#
#  id              :bigint(8)        not null, primary key
#  name            :string(255)      not null
#  email           :string(255)      not null
#  roles          :string(255)      default("admin")
#  password_digest :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_admins_on_email  (email)
#

class AdminSerializer < ActiveModel::Serializer

  attributes :id,
             :name,
             :username,
             :email,
             :mobile,
             :roles,
             :photo_profil_url,
             :active_status,
             :created_at

end
