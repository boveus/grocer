class RecipeIngredientsController < ApplicationController
  before_action :require_user

  def destroy
    @user = User.find(params[:user_id])
    recipe = Recipe.find(params[:recipe_id])
    recipe_ingredient = RecipeIngredient.find(params[:id])
    recipe_ingredient.destroy
    redirect_to user_recipe_path(@user, recipe)
  end
end
