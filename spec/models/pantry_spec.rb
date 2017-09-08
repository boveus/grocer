require 'rails_helper'

describe Pantry do
  before(:each) do
    user = User.create(name: 'Bobby', email: "Jimbo@hotmail.com", password_digest: '1234')
    @pantry = Pantry.create(user: user)
    category = Category.create(title: 'Produce')
    ingredient = Ingredient.create(name: 'pork ribs', measurement: 'pounds of', category: category)
    ingredient2 = Ingredient.create(name: 'sausages', measurement: 'number of', category: category)
    pantry_ingredient = PantryIngredient.create(number: 1, pantry: @pantry, ingredient: ingredient)
    pantry_ingredient = PantryIngredient.create(number: 3, pantry: @pantry, ingredient: ingredient2)
  end

  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a user" do
        pantry = Pantry.new()
        expect(pantry).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a user" do
        expect(@pantry).to be_valid
      end
    end
  end

  describe "class methods" do
    it "can generate a list of ingredients with a count" do
        expect(@pantry.ingredient_list.first.name).to eq('pork ribs')
        expect(@pantry.ingredient_list.second.measurement).to eq('number of')
        expect(@pantry.ingredient_list.first.number).to eq(1)
        expect(@pantry.ingredient_list.second.number).to eq(3)
        expect(@pantry.ingredient_list.length).to eq(2)
    end
  end
end
