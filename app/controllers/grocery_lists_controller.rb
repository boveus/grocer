class GroceryListsController < ApplicationController
  def choose_recipes
    @recipes = this_user.recipes
    @user = this_user
    @grocerylist = GroceryList.new
  end

  def create_grocery_list
    recipe_ingredients = Recipe.ingredient_lists(params[:recipes])
    pantry_ingredients = this_user.pantry.ingredient_list
    grocery_hash = GroceryList.generate_recipe_hash(recipe_ingredients, pantry_ingredients)
    this_user.grocery_list.update(title: params[:title], list: grocery_hash)
    redirect_to user_grocery_list_path(this_user)
  end

  def show
    @user = this_user
    @grocery_list = this_user.grocery_list
  end
end
