class RecipesController < ApplicationController
  before_action :require_user

  def index
    @user = this_user
    @recipes = @user.recipes
  end

  def show
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:id])
  end

  def new
    @user = this_user
    @recipe = Recipe.new
  end

  def update
    @user = this_user
    recipe = Recipe.find(params[:id])
    category_title = recipe_attributes["ingredient"]["category"]
    measurement = recipe_attributes["ingredient"]["measurement"]
    name = recipe_attributes["ingredient"]["name"]
    number = recipe_attributes["recipe_ingredient"]["number"]

    Recipe.add_grocery_to_recipe(
    category_title, name, measurement, recipe, number)
    redirect_to user_recipe_path(@user, recipe)
  end

  def create
    @user = this_user
    recipe = Recipe.new
    recipe.description = recipe_title[:description]
    recipe.user = @user
    recipe.save
    redirect_to user_recipes_path(@user)
  end

  def destroy
    @user = this_user
    recipe = Recipe.find(params[:id])
    recipe_ingredients = RecipeIngredient.find_by(recipe_id: recipe.id)
    if recipe_ingredients
      recipe_ingredients.destroy
    end
    Recipe.destroy(recipe.id)
    redirect_to user_recipes_path(@user)
  end


  private

  def recipe_title
    params.require(:recipe).permit(:description)
  end

  def recipe_attributes
    params.require(:recipe).permit(ingredient: [:category, :measurement, :name], recipe_ingredient: :number)
  end

  def this_user
    User.find(params[:user_id])
  end

end
