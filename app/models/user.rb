class User < ApplicationRecord
    has_many :semesters, :dependent => :destroy
    has_many :courses, through: :semesters, :dependent => :destroy
    has_secure_password
    validates :username, uniqueness: true
    validates :password, length: { minimum: 4 }, allow_nil: true
    validates :username, presence: true
    validates :password, presence: true
    validates :password_confirmation, presence: true
    def num_credits
        self.courses.sum(:credits)
    end
    def grades
        self.courses.select(:grade).to_a
    end

end
