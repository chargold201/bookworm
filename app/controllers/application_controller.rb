class ApplicationController < ActionController::Base

  # gives access to methods in views
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authorize
    redirect_to login_path if !logged_in?
  end

end
