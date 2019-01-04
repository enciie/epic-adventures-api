class UserTripSerializer < ActiveModel::Serializer
  attributes :id, :trip_id, :user_id

  belongs_to :user
  belongs_to :trip
  has_many :comments, through: :trip
end
