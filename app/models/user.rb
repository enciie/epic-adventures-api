class User < ApplicationRecord
    has_secure_password

    validates :name, :hometown, :password, presence: true
    validates :username, presence: true
    validates :email, presence: true

    has_many :trips
end
