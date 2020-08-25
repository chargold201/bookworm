class SessionsController < ApplicationController

  def home

  end

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "Hello, #{user.name}!"
      redirect_to reviews_path
    else
      flash[:danger] = "Incorrect login info, please try again"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
