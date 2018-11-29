class Semester < ApplicationRecord
    belongs_to :user
    has_many :courses
    
    validates :user_id, uniqueness: {scope: [:term, :year]}
    
    def credit_sum
        self.courses.sum(:credits)
    end
    
    def gpa
        @GradeList = courses.select(:grade).to_a
        
    end
end
