require 'app/models/modules/ingredient_methods'

class RecipeIngredient < ApplicationRecord
include IngredientMethods
  belongs_to :recipe
  belongs_to :ingredient
end
