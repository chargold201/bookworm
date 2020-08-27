class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in(user)
    else
      # flash message depending on what was wrong
      redirect_to signup_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end

private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end