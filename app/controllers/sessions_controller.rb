class SessionsController < ApplicationController

  def home

  end

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      log_in(@user)
    else
      flash[:danger] = "Incorrect login info, please try again"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
