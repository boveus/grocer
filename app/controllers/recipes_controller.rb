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
    @ingredient = Ingredient.new
  end

  private

  def this_user
    User.find(params[:user_id])
  end
end
