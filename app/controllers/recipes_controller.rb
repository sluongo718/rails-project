class RecipesController < ApplicationController
    before_action :require_login
    before_action :current_recipe, except: [:index, :new, :create,]

    def index 
        @recipes = Recipe.all
    end

    def new 
        @recipe = Recipe.new
    end

    def create
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save
            redirect_to recipes_path(@recipe)
        else
            flash[:error] = "please fill in all fields"
            render :new
        end
     
    end

    def show
    
        @recipe = Recipe.find_by(id: params[:id])
    end

    def edit
        
    end

    def update
       
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end
    end

    def destroy
        @recipe.destroy
        redirect_to recipes_path
    end

    private

    def recipe_params 
        params.require(:recipe).permit(:name, :cook_time, :directions, category_ids: [])
    end 

    def current_recipe
        @recipe = Recipe.find_by_id(params[:id])
    end

end
