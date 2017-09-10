class PantryController < ApplicationController
  def show
    @user = this_user
    @pantry = @user.pantry
    @ingredients_list = @pantry.ingredients
  end

  def update
      user = this_user
      recipe = Recipe.find(params[:id])

      category_title = params["pantry"]["ingredient"]["category"]
      category = Category.find_or_create_by(title: category_title)
      measurement = params["pantry"]["ingredient"]["measurement"]
      name = params["pantry"]["ingredient"]["name"]
      number = params["pantry"]["pantry_ingredient"]["number"]

      Pantry.add_grocery_to_pantry(number, measurement, name, category.id, user.pantry.id)

      redirect_to user_pantry_path(user, user.pantry)
  end

end
