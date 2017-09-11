class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      session[:logged_in] = true
      flash[:notice] = "Welcome #{@user.name}"
      redirect_to user_home_path(@user)
    else
      flash[:notice] = "Invalid Login"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Goodbye"
    redirect_to root_path
  end
end
