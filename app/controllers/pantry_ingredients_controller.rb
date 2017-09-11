class PantryIngredientsController < ApplicationController
  before_action :require_user

  def destroy
    @user = User.find(params[:user_id])
    pantry = Pantry.find(params[:pantry_id])
    pantry_ingredient = PantryIngredient.find(params[:id])
    pantry_ingredient.destroy
    redirect_to user_pantry_path(@user, pantry)
  end
end
