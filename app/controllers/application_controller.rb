class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    !!current_user or redirect_to login_url, :notice => "Login first!"
  end

  helper_method :current_user, :authenticate_user!
end
