class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :trip_id, :username
  belongs_to :user
  belongs_to :trip

  def username
    object.user.username
  end
end
