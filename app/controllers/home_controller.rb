class HomeController < ApplicationController
    def home
        if logged_in?
            totalcredits = 0
            current_user.courses.each do |course|
                if course.grade != "F"
                    totalcredits = totalcredits + course.credits
                end
            end
                @credits = totalcredits
        end
    end
end
