# encoding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :create]
  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to edit_user_path, :notice => "Daten geändert"
    else
      render :action => "edit"
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Registrierung erfolgreich!"
    else
      render "new"
    end
  end
end
