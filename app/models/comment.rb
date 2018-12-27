class Comment < ApplicationRecord
  belongs_to :trip, optional: true
  belongs_to :user
  validates :content, presence: true
end
