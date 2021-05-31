class SessionsController < ApplicationController


    def new
        if current_user
            redirect_to user_path(current_user)
        end
    end

    def create
        @user = User.find_by(:email => params[:user][:email])
            if @user
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                render :new
            end
    end

    def destroy
       
        if current_user
            session.delete :user_id
            redirect_to :root
        end
    end
end