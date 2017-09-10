class RecipesController < ApplicationController
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
    user = User.find(params[:user_id])
    recipe = Recipe.find(params[:id])

    category_title = params["recipe"]["ingredient"]["category"]
    measurement = params["recipe"]["ingredient"]["measurement"]
    name = params["recipe"]["ingredient"]["name"]
    number = params["recipe"]["recipe_ingredient"]["number"]

    Recipe.add_grocery_to_recipe(
    category_title, name, measurement, recipe, number)
    redirect_to user_recipe_path(user, recipe)
  end

  def create
    user = this_user
    recipe = Recipe.new
    recipe.description = params[:recipe][:description]
    recipe.user = user
    recipe.save
    redirect_to user_recipes_path(user)
  end

  def destroy
    user = this_user
    recipe = Recipe.find(params[:id])
    recipe_ingredients = RecipeIngredient.find_by(recipe_id: recipe.id)
    recipe_ingredients.destroy
    Recipe.destroy(recipe.id)
    redirect_to user_recipes_path(user)
  end


  private

  def this_user
    User.find(params[:user_id])
  end

end
