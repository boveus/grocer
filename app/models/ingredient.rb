class Ingredient < ApplicationRecord
  belongs_to :category
  validates :name, presence: true, uniqueness: true
  validates :measurement, presence: true
end
