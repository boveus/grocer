class Ingredient < ApplicationRecord
  belongs_to :category
  has_many :recipe_ingredients
  has_many :pantry_ingredients
  
  validates :name, presence: true, uniqueness: true
  validates :measurement, presence: true

  def name_and_measurement
    "#{measurement} of #{name}"
  end
end
