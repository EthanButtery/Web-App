class Semester < ApplicationRecord
    belongs_to :user
    has_many :courses
    validates :type, :year, presence: true, uniqueness: true
    
    def credit_sum
        self.courses.sum(:credits)
    end
    
    Semester.update_attribute(total_credits, credit_sum)
end
