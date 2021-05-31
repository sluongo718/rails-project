class RecipeIngredientsController < ApplicationController
    before_action :require_login

    def new
        if recipe 
           
        @recipe_ingredient = @recipe.recipe_ingredients.new 
        else
            @recipe_ingredient = RecipeIngredient.new
        end

        @ingredient = Ingredient.new
        @ingredients = Ingredient.all
    end

    def create
          
        if selecting_and_creating_ingredient
            @recipe_ingredient = RecipeIngredient.new
            @recipe_ingredient.recipe_id = params[:recipe_id]
            @ingredient = Ingredient.new 
            render :new
        end

        @recipe_ingredient = RecipeIngredient.create(recipe_ingredient_params)

        if create_ingredient
            
            Ingredient.create(recipe_ingredient_params[:ingredient_attributes])
        else
            @recipe_ingredient.ingredient = Ingredient.find_by_id(recipe_ingredient_params[:ingredient_id])
        end

        if @recipe_ingredient.save
            redirect_to recipe_path(@recipe_ingredient.recipe_id)
        else
            render :new
        end


    end

    def index 
        recipe
    end

    private 

    def recipe
        @recipe = Recipe.find_by_id(params[:recipe_id])
      end

    def recipe_ingredient_params
        
        params.require(:recipe_ingredient).permit(:recipe_id, :ingredient_id, :quantity, ingredient_attributes: [:name])
    end

    def selecting_and_creating_ingredient
        recipe_ingredient_params[:ingredient_id] != "" && recipe_ingredient_params[:ingredient_attributes][:name] != ""
    end

    def create_ingredient
        recipe_ingredient_params[:ingredient_id] == ""
    end
end