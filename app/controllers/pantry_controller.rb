class PantryController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @pantry = @user.pantry
    @ingredients_list = @pantry.ingredients
  end
end
