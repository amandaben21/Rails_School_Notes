class User < ApplicationRecord
    has_many :notes
    has_many :subjects, through: :notes

    has_secure_password
    

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
end
