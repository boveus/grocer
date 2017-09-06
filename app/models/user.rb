class User < ApplicationRecord
has_many :recipes
has_one :pantry
has_many :grocery_lists
has_many :recipe_ingredients, through: :recipes
has_many :pantry_ingredients, through: :pantry
end
