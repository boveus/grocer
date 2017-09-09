class Pantry < ApplicationRecord
  belongs_to :user
  has_many :pantry_ingredients
  has_many :ingredients, through: :pantry_ingredients

  def ingredient_list
    Pantry
    .where(id: id)
    .joins(:ingredients)
    .select('pantry_ingredients.number as number,
    ingredients.measurement as measurement, ingredients.name as name')
  end
end
