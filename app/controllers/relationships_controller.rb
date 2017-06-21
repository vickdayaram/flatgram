
class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:user][:followed_id])
    current_user.follow(user)
    redirect_to pictures_path
  end

  def destroy
    user = Relationship.find_by(follower_id: current_user.id, followed_id: params[:user][:followed_id]).followed
    current_user.unfollow(user)
    redirect_to pictures_path
  end
end
