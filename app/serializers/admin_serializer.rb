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
             :email,
             :roles,
             :created_at

end
