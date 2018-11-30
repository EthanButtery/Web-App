class HomeController < ApplicationController
    def home
        if logged_in?
            @credits = current_user.num_credits
        end
    end
end
