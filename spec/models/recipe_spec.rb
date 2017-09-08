require 'rails_helper'

describe Recipe do
  before(:each) do
    user = User.create(name: 'Bobby', email: "Jimbo@hotmail.com", password_digest: '1234')
    @recipe = Recipe.create(description: 'jimbos special ribs', user: user)
    category = Category.create(title: 'Produce')
    ingredient = Ingredient.create(name: 'pork ribs', measurement: 'pounds of', category: category)
    ingredient2 = Ingredient.create(name: 'sausages', measurement: 'number of', category: category)
    recipe_ingredient = RecipeIngredient.create(number: 1, recipe: @recipe, ingredient: ingredient)
    recipe_ingredient = RecipeIngredient.create(number: 3, recipe: @recipe, ingredient: ingredient2)
  end

  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a description or user" do
        recipe = Recipe.new()
        expect(recipe).to be_invalid
      end
      it "is invalid without a user" do
        recipe = Recipe.new(description: 'jimbos special ribs')
        expect(recipe).to be_invalid
      end
    end

    describe "class methods" do
      it "can generate a list of ingredients with a count" do
          expect(@recipe.ingredient_list.first.name).to eq('pork ribs')
          expect(@recipe.ingredient_list.second.measurement).to eq('number of')
          expect(@recipe.ingredient_list.first.number).to eq(1)
          expect(@recipe.ingredient_list.second.number).to eq(3)
          expect(@recipe.ingredient_list.length).to eq(2)
      end
    end
  end
end
