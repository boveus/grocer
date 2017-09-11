class PantryController < ApplicationController
  before_action :require_user

  def show
    @user = this_user
    @pantry = @user.pantry
    @ingredients_list = @pantry.ingredients
  end

  def update
      @user = this_user
      pantry = Pantry.find(params[:id])

      category_title = pantry_attributes["ingredient"]["category"]
      category = Category.find_or_create_by(title: category_title)
      measurement = pantry_attributes["ingredient"]["measurement"]
      name = pantry_attributes["ingredient"]["name"]
      number = pantry_attributes["pantry_ingredient"]["number"]

      Pantry.add_grocery_to_pantry(number, measurement, name, category.id, @user.pantry.id)

      redirect_to user_pantry_path(@user, @user.pantry)
  end

  private

  def pantry_attributes
    params.require(:pantry).permit(ingredient: [:category, :measurement, :name], pantry_ingredient: :number)
  end

end
