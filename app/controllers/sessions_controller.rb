class SessionsController < ApplicationController

  def welcome

  end

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    session[:user_id] = @user.id
    redirect_to reviews_path
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
