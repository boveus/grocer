class Ingredient < ApplicationRecord
  belongs_to :category
  has_many :recipe_ingredients
  has_many :pantry_ingredients

  validates :name, presence: true, uniqueness: true
  validates :measurement, presence: true

  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true

  def name_and_measurement
    "#{measurement} #{name}"
  end

  def amount_for(recipe_id)
    recipe_ingredients.where(recipe: recipe_id).first.number
  end

  def amount_for_pantry(pantry_id)
    pantry_ingredients.where(pantry: pantry_id).first.number
  end
end
