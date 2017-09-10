class Recipe < ApplicationRecord
  belongs_to :user

  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true

  def ingredient_list
    Recipe.where(id: id)
    .joins(:ingredients)
    .select('recipe_ingredients.number as number,
    ingredients.measurement as measurement, ingredients.name as name,
    ingredients.category_id as category_id')
  end

  def self.ingredient_lists(id_list)
    where(id: id_list)
    .joins(:ingredients)
    .select('recipe_ingredients.number as number,
    ingredients.measurement as measurement, ingredients.name as name,
    ingredients.category_id as category_id')
  end

  def self.add_grocery_to_recipe(category, name, measurement, recipe, number)
    category = Category.find_or_create_by(title: category)
    ingredient = Ingredient.find_or_create_by(name: name, measurement: measurement,
    category_id: category.id)
    RecipeIngredient.find_or_create_by(recipe_id: recipe.id, ingredient_id: ingredient.id,
    number: number)
  end
end
