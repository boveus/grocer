class Pantry < ApplicationRecord
  belongs_to :user
  has_many :pantry_ingredients
  has_many :ingredients, through: :pantry_ingredients

  def ingredient_list
    Pantry
    .where(id: id)
    .joins(:ingredients)
    .select('pantry_ingredients.number as number,
    ingredients.measurement as measurement, ingredients.name as name,
    ingredients.category_id as category_id')
  end

  def self.add_grocery_to_pantry(number, measurement, name, category_id, pantry_id)
    ingredient = Ingredient.find_or_create_by(name: name, measurement: measurement,
    category_id: category_id)
    PantryIngredient.find_or_create_by(pantry_id: pantry_id, ingredient_id: ingredient.id,
    number: number)
  end
end


# user = User.find(params[:user_id])
# recipe = Recipe.find(params[:id])
# category_title = params["recipe"]["ingredient"]["category"]
# ingredient_measurement = params["recipe"]["ingredient"]["measurement"]
# ingredient_name = params["recipe"]["ingredient"]["name"]
# ingredient_number = params["recipe"]["recipe_ingredient"]["number"]
#
# category = Category.find_or_create_by(title: category_title)
# ingredient = Ingredient.find_or_create_by(name: ingredient_name,
# measurement: ingredient_measurement, category: category)
# RecipeIngredient.find_or_create_by(recipe_id: recipe.id,
# ingredient_id: ingredient.id, number: ingredient_number)
# redirect_to user_recipe_path(user, recipe)
