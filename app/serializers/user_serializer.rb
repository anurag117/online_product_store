class UserSerializer < ActiveModel::Serializer
  attributes :id, :email_id, :password_hash, :password_salt
end
