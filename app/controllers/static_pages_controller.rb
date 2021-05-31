class StaticPagesController < ApplicationController

    def welcome
        if current_user 
            redirect_to user_path(current_user)
        end
    end

end
