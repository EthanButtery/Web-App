class Semester < ApplicationRecord
    belongs_to :user
    has_many :courses
    validates :type, :year, presence: true, uniqueness: true
end
