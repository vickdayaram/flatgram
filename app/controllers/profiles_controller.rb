
class ProfilesController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    @pictures = User.find_by(username: params[:username]).pictures.order('created_at DESC')
  end
end
