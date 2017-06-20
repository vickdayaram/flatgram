class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def picture_params
    params.require(:picture).permit(:image_url, :title, :user_id)
  end

  def comment_params
    params.require(:comment).permit(:image_url, :title, :user_id)
  end 

end
