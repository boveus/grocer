require 'rails_helper'

describe Ingredient do
  before(:each) do
    @category = Category.create(title: 'Produce')
    @ingredient = Ingredient.create(name: 'pounds of pork ribs', measurement: 5, category: @category)
  end

  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name, measurement, or category" do
        ingredient = Ingredient.new()
        expect(ingredient).to be_invalid
      end
      it "is invalid without a category" do
        ingredient = Ingredient.create(name: 'pounds of pork ribs', measurement: 5)
        expect(ingredient).to be_invalid
      end
      it "is invalid without a name or measurement" do
        ingredient = Ingredient.create(category: @category)
        expect(ingredient).to be_invalid
      end
      it "must have a unique name" do
        ingredient = Ingredient.create(name: 'pounds of pork ribs', measurement: 5, category: @category)
        expect(ingredient).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all the things" do
        expect(@ingredient).to be_valid
      end
    end
  end
end
