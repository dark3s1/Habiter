class ApplicationController < ActionController::Base
    def set_habits
        @habits = current_user.habits.all
    end
end
