class User < ApplicationRecord
    has_secure_password
    has_many :semesters
    has_many :courses, through: :semesters
    validates :username, uniqueness: true
    validates :password, length: { minimum: 4 }
    def num_credits
        self.courses.sum(:credits)
    end
    def grades
        self.courses.select(:grade).to_a
    end

end
