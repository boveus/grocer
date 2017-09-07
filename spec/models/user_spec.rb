require 'rails_helper'

describe User do
  before(:each) do
    @user = User.create(name: 'Bobby', email: "Jimbo@hotmail.com", password_digest: '1234')
  end

  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name, email, or password" do
        user = User.new()
        expect(user).to be_invalid
      end

      it "has a unique email" do
        user = User.new(name: 'Jimbob', email: "Jimbo@hotmail.com", password_digest: '1234')
        expect(user).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all the things" do
        expect(@user).to be_valid
      end
    end
  end
end
