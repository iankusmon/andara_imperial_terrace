class CustomerSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :username,
             :email,
             :mobile,
             :roles,
             :nik,
             :photo_profile_url
end
