require 'rails_helper'

describe PantryIngredient do
  before(:each) do
    user = User.create(name: 'Bobby', email: "Jimbo@hotmail.com", password_digest: '1234')
    @category = Category.create(title: 'Produce')
    @ingredient = Ingredient.create(name: 'pounds of pork ribs', measurement: 5, category: @category)
    @pantry = Pantry.create(user: user)
    @pantry_ingredient = PantryIngredient.create(pantry: @pantry, ingredient: @ingredient)
  end

  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a description or user" do
        pantry = PantryIngredient.new()
        expect(pantry).to be_invalid
      end
      it "is invalid without an ingredient" do
        pantry_ingredient = PantryIngredient.new(pantry: @pantry)
        expect(pantry_ingredient).to be_invalid
      end
      it "is invalid without a pantry" do
        pantry_ingredient = PantryIngredient.new(ingredient: @ingredient)
        expect(pantry_ingredient).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all the things" do
        expect(@pantry_ingredient).to be_valid
      end
    end
  end
end
