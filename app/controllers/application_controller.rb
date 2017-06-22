class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :current_user?, :relationship_exists?

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def current_user?(user)
    user == current_user
  end

  def authenticated
    if !logged_in?
      redirect_to home_path
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :avatar)
  end

  def picture_params
    params.require(:picture).permit(:image_url, :title, :user_id, :tags_attributes, :tag_id, :image)
  end

  def relationship_exists?(current_user, user)
    !!Relationship.find_by(follower_id: current_user.id, followed_id: user.id)
  end

end
