class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :require_user

    def current_user
      @user = User.find(session[:user_id]) if session[:user_id]
    end

    def require_user
      if current_user.nil?
        render '/public/404.html'
      elsif current_user != this_user
        redirect_to user_home_path(current_user)
      end
    end

    def require_login
      unless session[:logged_in]
        flash[:error] = "You must be logged in to access this section"
        redirect_to login_path
      end
    end

  private

  def this_user
    User.find(params[:user_id])
  end

end
