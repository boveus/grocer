require 'rails_helper'

describe Category do
  before(:each) do
    @category = Category.create(title: 'dairy')
  end

  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        category = Category.new()
        expect(category).to be_invalid
      end
      it "must have a unique title" do
        category = Category.new(title: 'dairy')
        expect(category).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all the things" do
        expect(@category).to be_valid
      end
    end
  end
end
