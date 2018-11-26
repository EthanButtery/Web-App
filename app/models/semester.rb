class Semester < ApplicationRecord
    belongs_to :user
    has_many :courses
    validates :term, :year, presence: true, uniqueness: true
    
    def credit_sum
        self.courses.sum(:credits)
    end
    
    def gpa
        @GradeList = courses.select(:grade).to_a
    end
    
end
