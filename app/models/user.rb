class User < ApplicationRecord
    has_many :notes
    has_many :subjects, through: :notes
    

    validates :username, :email, :password presence: true
    validates :username, :email, uniqueness: true
end
