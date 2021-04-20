class Subject < ApplicationRecord
    has_many :notes
    
    scope :alpha, -> { order(:name)}

    validates :name, presence: true
end
