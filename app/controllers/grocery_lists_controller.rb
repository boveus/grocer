class GroceryListsController < ApplicationController
  def choose_recipes
    @recipes = this_user.recipes
  end

  def create_grocery_list
    ingredient_list = Recipe.ingredient_lists(params[:recipes])
    binding.pry
    @grocery_list = GroceryList.new
  end
end
