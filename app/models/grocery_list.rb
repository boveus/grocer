class GroceryList < ApplicationRecord
  belongs_to :user
  store :list

  def self.compute_recipe_hash(recipe_ingredients)
    recipe_hash = {}
    recipe_ingredients.each do |ingredient|
      number = ingredient.number
      measurement = ingredient.measurement
      name = ingredient.name
      if recipe_hash["#{measurement} of #{name}"]
        recipe_hash["#{measurement} of #{name}"] += number
      else
        recipe_hash["#{measurement} of #{name}"] = number
      end
    end
    recipe_hash
  end

  def self.account_for_pantry_items(pantry_ingredients, recipe_hash)
    pantry_hash = {}
    pantry_ingredients.each do |ingredient|
      number = ingredient.number
      measurement = ingredient.measurement
      name = ingredient.name
      if recipe_hash["#{measurement} of #{name}"]
        recipe_hash["#{measurement} of #{name}"] -= number
      end
      if recipe_hash["#{measurement} of #{name}"] && recipe_hash["#{measurement} of #{name}"] <= 0
        recipe_hash.delete("#{measurement} of #{name}")
      end
    end
    recipe_hash
  end

  def self.generate_recipe_hash(recipe_ingredients, pantry_ingredients)
    recipe_hash = compute_recipe_hash(recipe_ingredients)
    account_for_pantry_items(pantry_ingredients, recipe_hash)
  end
end
