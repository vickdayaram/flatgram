class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authenticated
    if !logged_in?
      redirect_to home_path
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def picture_params
    params.require(:picture).permit(:image_url, :title, :user_id, :tags_attributes, :tag_id, :image)
  end


end
