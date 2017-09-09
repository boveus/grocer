class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def this_user
    User.find(params[:user_id])
  end

end
