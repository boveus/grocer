require './app/lib/ingredient_calculator'

class User < ApplicationRecord
has_many :recipes
has_one :pantry
has_many :grocery_lists
has_many :recipe_ingredients, through: :recipes
has_many :pantry_ingredients, through: :pantry
has_many :ingredients, through: :recipe_ingredients

validates :name, :email, :password_digest, presence: true
validates :email, uniqueness: true

  def retrieve_selected_recipe_ingredients(recipe_ids)
    recipe_ingredients
    .where(recipe_id: recipe_ids)
  end

  def calculate_grocery_list(recipe_ids)
    user_recipes = retrieve_selected_recipe_ingredients(recipe_ids)
    calculator = IngredientCalculator.new(self, user_recipes, pantry)
  end



end
