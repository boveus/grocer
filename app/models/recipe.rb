class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients, dependent: :destroy

  accepts_nested_attributes_for :recipe_ingredients, :ingredients, allow_destroy: true

  def ingredient_list
    Recipe.where(id: id)
    .joins(:ingredients)
    .select('recipe_ingredients.number as number,
    ingredients.measurement as measurement, ingredients.name as name')
  end

  def self.ingredient_lists(id_list)
    where(id: id_list)
    .joins(:ingredients)
    .select('recipe_ingredients.number as number,
    ingredients.measurement as measurement, ingredients.name as name')
  end

  def destroy

  end
end
