require 'rails_helper'

describe RecipeIngredient do
  before(:each) do
    user = User.create(name: 'Bobby', email: "Jimbo@hotmail.com", password_digest: '1234')
    @category = Category.create(title: 'Produce')
    @ingredient = Ingredient.create(name: 'pounds of pork ribs', measurement: 5, category: @category)
    @recipe = Recipe.create(description: 'jimbos special ribs', user: user)
    @recipe_ingredient = RecipeIngredient.create(recipe: @recipe, ingredient: @ingredient)
  end

  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a description or user" do
        recipe = RecipeIngredient.new()
        expect(recipe).to be_invalid
      end
      it "is invalid without an ingredient" do
        recipe_ingredient = RecipeIngredient.new(recipe: @recipe)
        expect(recipe_ingredient).to be_invalid
      end
      it "is invalid without a recipe" do
        recipe_ingredient = RecipeIngredient.new(ingredient: @ingredient)
        expect(recipe_ingredient).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all the things" do
        expect(@recipe_ingredient).to be_valid
      end
    end
  end
end
