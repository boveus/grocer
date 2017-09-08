class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def ingredient_list
    Recipe.where(id: id)
    .joins(:ingredients)
    .select('recipe_ingredients.number as number,
    ingredients.measurement as measurement, ingredients.name as name')
  end
end
