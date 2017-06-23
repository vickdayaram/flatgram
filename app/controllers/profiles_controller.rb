
class ProfilesController < ApplicationController

  def show
    @profileuser = User.find_by(username: params[:username])
    @user = current_user
    @pictures = User.find_by(username: params[:username]).pictures.order('created_at DESC')
  end

end
