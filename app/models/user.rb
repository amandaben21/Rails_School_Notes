class User < ApplicationRecord
    has_many :notes
    has_many :subjects, through: notes
    has_secure_password
end
