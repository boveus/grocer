# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
count = 0
  category = Category.create(title: Faker::File.extension)
ingredient = Ingredient.create(category: category, name: Faker::Food.unique.ingredient, measurement: 'pounds of' )
ingredient2 = Ingredient.create(category: category, name: Faker::Food.unique.ingredient, measurement: 'pounds of' )
ingredient3 = Ingredient.create(category: category, name: Faker::Food.unique.ingredient, measurement: 'pounds of' )

300.times do
  count += 1
  name = "#{Faker::GameOfThrones.unique.character}#{((1..1000).to_a).sample}"
  description = Faker::HitchhikersGuideToTheGalaxy.quote
  user = User.create(name: name, email: "#{name}@raven.com", password_digest: '123')
  recipe = Recipe.create(user_id: rand(0..count), description: Faker::Food.dish)
  RecipeIngredient.create(recipe: recipe, ingredient_id: ingredient.id, number: rand(1..5))
  RecipeIngredient.create(recipe: recipe, ingredient_id: ingredient2.id, number: rand(1..5))
  RecipeIngredient.create(recipe: recipe, ingredient_id: ingredient3.id, number: rand(1..5))
  pantry = Pantry.create(user: user)
  PantryIngredient.create(pantry: pantry, ingredient_id: ingredient.id, number: rand(1..5))
  PantryIngredient.create(pantry: pantry, ingredient_id: ingredient2.id, number: rand(1..5))
  PantryIngredient.create(pantry: pantry, ingredient_id: ingredient3.id, number: rand(1..5))
end
