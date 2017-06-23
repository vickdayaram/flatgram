class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Wrong username or password, please try again"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path
  end

end
