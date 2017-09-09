class UserController < ApplicationController
  def home
    @user = User.find(params[:user_id])
  end
end
