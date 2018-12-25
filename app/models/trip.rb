class Trip < ApplicationRecord
    belongs_to :user
    has_many :comments

    validates :name, :description, :locataion, :img_url, presence: true
end
