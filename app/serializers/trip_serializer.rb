class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :location, :img_url, :user_id

  has_many :comments
end
