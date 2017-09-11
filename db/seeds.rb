# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
count = 0
  category = Category.create(title: Faker::File.extension)

30.times do
  count += 1
  name = "#{Faker::GameOfThrones.unique.character}"
  user = User.create(name: name, email: "#{name.delete(' ')}@raven.com", password: '123')
  user.grocery_list = GroceryList.create(title: "You haven't created a grocery list yet.", user: user)
  recipe = Recipe.create(user_id: rand(0..count), description: Faker::Food.dish)
  ingredient = Ingredient.create(category: category, name: Faker::Food.unique.ingredient, measurement: 'pounds of' )
  ingredient2 = Ingredient.create(category: category, name: Faker::Food.unique.ingredient, measurement: 'cans of' )
  ingredient3 = Ingredient.create(category: category, name: Faker::Food.unique.ingredient, measurement: 'ounces of' )
  RecipeIngredient.create(recipe: recipe, ingredient_id: ingredient.id, number: rand(1..5))
  RecipeIngredient.create(recipe: recipe, ingredient_id: ingredient2.id, number: rand(1..5))
  RecipeIngredient.create(recipe: recipe, ingredient_id: ingredient3.id, number: rand(1..5))
  pantry = Pantry.create(user: user)
  PantryIngredient.create(pantry: pantry, ingredient_id: ingredient.id, number: rand(1..5))
  PantryIngredient.create(pantry: pantry, ingredient_id: ingredient2.id, number: rand(1..5))
  PantryIngredient.create(pantry: pantry, ingredient_id: ingredient3.id, number: rand(1..5))
end
