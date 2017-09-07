require 'rails_helper'

describe Recipe do
  before(:each) do
    user = User.create(name: 'Bobby', email: "Jimbo@hotmail.com", password_digest: '1234')
    @recipe = Recipe.create(description: 'jimbos special ribs', user: user)
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

    context "valid attributes" do
      it "is valid with all the things" do
        expect(@recipe).to be_valid
      end
    end
  end
end
