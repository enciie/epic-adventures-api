class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :hometown
end
