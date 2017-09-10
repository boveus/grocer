class GroceryListsController < ApplicationController
  def choose_recipes
    @recipes = this_user.recipes
  end

  def create_grocery_list
    recipe_ingredient_list = Recipe.ingredient_lists(params[:recipes])
    pantry_ingredient_list = this_user.pantry.ingredient_list
  end
end
