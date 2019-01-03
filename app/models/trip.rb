class Trip < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    
    validates :name, :description, :location, :img_url, presence: true
end
