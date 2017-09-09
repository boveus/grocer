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
    ingredient_measurement = params["recipe"]["ingredient"]["measurement"]
    ingredient_name = params["recipe"]["ingredient"]["name"]
    ingredient_number = params["recipe"]["recipe_ingredient"]["number"]

    category = Category.find_or_create_by(title: category_title)
    ingredient = Ingredient.find_or_create_by(name: ingredient_name,
    measurement: ingredient_measurement, category: category)
    RecipeIngredient.find_or_create_by(recipe_id: recipe.id,
    ingredient_id: ingredient.id, number: ingredient_number)
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
    Recipe.destroy(recipe.id)
    redirect_to user_recipes_path(user)
  end

  private

  def this_user
    User.find(params[:user_id])
  end
end
