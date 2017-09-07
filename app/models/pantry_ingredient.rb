require './app/models/modules/ingredient_methods'

class PantryIngredient < ApplicationRecord
include IngredientMethods
  belongs_to :pantry
  belongs_to :ingredient
end
