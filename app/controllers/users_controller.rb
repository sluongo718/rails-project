class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]

    def new
    binding.pry
        @user = User.new
    end

    def create
        
        @user = User.new(user_params)
        if @user.save
            
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        elsif params[:user][:password] != params[:user][:password_confirmation]
                flash[:error] = "passwords didnt match"
                render :new
        else
           flash[:error] = "sorry info was incorrect"

            render :new
        end
    end

    def show 
     
        @user = User.find_by_id(params[:id])
        if current_user.id == params[:id]
            redirect_to @user 
        end
    end

    def most_popular_user
        @user = User.most_popular_user
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
