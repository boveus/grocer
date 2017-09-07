require 'rails_helper'

describe Pantry do
  before(:each) do
    user = User.create(name: 'Bobby', email: "Jimbo@hotmail.com", password_digest: '1234')
    @pantry = Pantry.create(user: user)
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
end
