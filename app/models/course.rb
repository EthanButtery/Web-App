class Course < ApplicationRecord
    belongs_to :semester
    validates :credits, presence: true
    validates :grade, presence: true
end
