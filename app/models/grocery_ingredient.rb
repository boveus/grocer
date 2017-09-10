class GroceryIngredient < ApplicationRecord
  belongs_to :grocery_list
  belongs_to :ingredient
end
