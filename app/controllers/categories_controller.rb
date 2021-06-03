class CategoriesController < ApplicationController
    before_action :require_login

    def new 
        @category = Category.new
    end

    def create 
      
        @category = Category.find_or_create_by(category_params)
        if @category.save
         
            redirect_to user_path(current_user)
        else
            flash[:error] = "Please fill in a category"
            render :new
        end
    end

    def index
        @categories = Category.all
    end

    def show 
        @category = Category.find_by_id(params[:id])
        @recipes = @category.recipes
    end
    
    private

    def category_params 
        params.require(:category).permit(:name)
    end

end
