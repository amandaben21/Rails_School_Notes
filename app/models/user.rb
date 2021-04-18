require 'securerandom'

class User < ApplicationRecord
    has_many :comments
    has_many :notes
    has_many :subjects, through: :notes

    has_secure_password
    

    validates :username, :email, :password, presence: true
    validates :username, :email, uniqueness: true

    def self.find_by_omniauth(auth)
        self.find_or_create_by(uid: auth[:uid]) do |u|
            u.username = auth[:info][:name]
            u.email = auth[:info][:email]
            u.password = SecureRandom.hex
        end
    end
end
