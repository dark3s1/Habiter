class HomeController < ApplicationController
    def index
        redirect_to reals_path if user_signed_in?
    end
end
