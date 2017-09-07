class IngredientCalculator
  def initialize(user, recipes, pantry)
    @recipes = user.recipes
    @pantry = user.pantry
  end

  def find_recipe
    User.where(id: 1).joins(:recipes).joins(:recipe_ingredients).select('recipe_ingredients.number as ingredient_data').joins(:ingredients).select('ingredients.measurement as ingredient_data').first.ingredient_data
    user.recipes.joins(:recipe_ingredients).select('recipe_ingredients.number as total')
  end
end
