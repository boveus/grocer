require './app/lib/ingredient_calculator'

class User < ApplicationRecord
has_many :recipes
has_one :pantry
has_many :grocery_lists
has_many :recipe_ingredients, through: :recipes
has_many :pantry_ingredients, through: :pantry

validates :name, :email, :password_digest, presence: true
validates :email, uniqueness: true

  def selected_recipes(recipe_ids)
    recipes.find(recipe_ids)
  end

  def calculate_grocery_list
    calculator = IngredientCalculator.new(selected_recipes, pantry)
  end

end
