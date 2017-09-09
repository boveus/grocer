class Ingredient < ApplicationRecord
  belongs_to :category
  has_many :recipe_ingredients
  has_many :pantry_ingredients

  validates :name, presence: true, uniqueness: true
  validates :measurement, presence: true

  def name_and_measurement
    "#{measurement} #{name}"
  end

  def amount_for(recipe_id)
    recipe_ingredients.where(recipe: recipe_id).first.number
  end
end
