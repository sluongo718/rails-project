class SessionsController < ApplicationController
  

    def new
        if current_user
            redirect_to user_path(current_user)
        end
    end


    def create
       
        if  @user = User.create_from_omniauth(auth)
            binding.pry
                session[:user_id] = @user.id
                redirect_to user_path(@user)
        else
            @user = User.find_by(:email => params[:user][:email])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:error] = "Looks like your info was incorrect. try again."
                render :new
            end
        end
    end



    def destroy
       
        if current_user
            session.delete :user_id
            redirect_to :root
        end
    end

    private

    def auth
       
      request.env['omniauth.auth']
    end


end
