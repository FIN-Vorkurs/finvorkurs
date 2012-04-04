# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    !!current_user or redirect_to login_url, :notice => "Erst einloggen!"
  end

  def authenticate_admin!
    user = current_user and 
      user.role >= User::ADMIN or 
        redirect_to login_url, :notice => "Nur für Admins!"
  end

  helper_method :current_user, :authenticate_user!
end
