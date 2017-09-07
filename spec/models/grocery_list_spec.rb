require 'rails_helper'

describe GroceryList do
  before(:each) do
    user = User.create(name: 'Bobby', email: "Jimbo@hotmail.com", password_digest: '1234')
    @grocerylist = GroceryList.create(user: user)
  end

  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a user" do
        grocerylist = GroceryList.new()
        expect(grocerylist).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a user" do
        expect(@grocerylist).to be_valid
      end
    end
  end
end
