class User < ApplicationRecord
    has_many :semesters
    has_many :courses, through: :semesters
    has_secure_password
    validates :username, uniqueness: true
    validates :password, length: { minimum: 4 }, allow_nil: true
    def num_credits
        self.courses.sum(:credits)
    end
    def grades
        self.courses.select(:grade).to_a
    end

end
