# Coding: UTF-8
class PasswordResetsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to root_url, :notice => "Email mit Anweisungen gesendet"
  end

  def edit
    @user = User.find_by_password_reset_token! params[:id]
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 24.hours.ago
      redirect_to new_password_reset_path, :alert => "Passwort Reset ist abgelaufen."
    elsif @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Passwort geändert"
    else
      render :edit
    end
  end
end
