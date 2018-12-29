class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :location, :img_url

  has_many :comments
  belongs_to :user
end
