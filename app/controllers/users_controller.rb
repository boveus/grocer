class UsersController < ApplicationController
  def home
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_attributes)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Successful login"
      @user.pantry = Pantry.create(user: @user)
      @user.grocery_list = GroceryList.create(title: "You haven't created a grocery list yet.", user: @user)
      redirect_to user_home_path(@user)
    else
      flash[:notice] = "Unsuccessful login"
      redirect_to :root
    end
  end

  private

  def user_attributes
    params.require(:user).permit(:name, :email, :password)
  end
end
