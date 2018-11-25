class Course < ApplicationRecord
    belongs_to :semester
    belongs_to :user
    validates :credits, presence: true
    validates :grade, presence: true
    
end
