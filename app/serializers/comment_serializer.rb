class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :trip_id
  belongs_to :user
end
