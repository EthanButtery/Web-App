class Semester < ApplicationRecord
    belongs_to :user
    has_many :courses, :dependent => :destroy
    
    validates :user_id, uniqueness: {scope: [:term, :year]}
    validates :term, presence: true
    validates :year, presence: true
    
    def credit_sum
        self.courses.sum(:credits)
    end
    def termAndYear
        "#{term} #{year}"
    end
    
    def gpa
        @GradeList = courses.select(:grade).to_a
        
    end
end
