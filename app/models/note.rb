class Note < ApplicationRecord
    belongs_to :user
    belongs_to :subject

    validates :lesson_name, :date, :note_entry, presence: true

    accepts_nested_attributes_for :subject, reject_if: proc { |attributes| attributes['name'].blank? }
end
