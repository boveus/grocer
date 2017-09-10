class GroceryListsController < ApplicationController
  def choose_recipes
    @recipes = this_user.recipes
  end

  def create_grocery_list
    recipe_ingredients = Recipe.ingredient_lists(params[:recipes])
    pantry_ingredients = this_user.pantry.ingredient_list
    flash[:recipe_hash] = GroceryList.generate_recipe_hash(recipe_ingredients, pantry_ingredients)
    redirect_to user_grocery_list_path(this_user)
  end

  def show
    @recipe_hash = flash[:recipe_hash]
  end
end
