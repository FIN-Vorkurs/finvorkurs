# encoding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :create, :index]
  before_filter :authenticate_admin!, :only => :index

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user || current_user.role == User::ADMIN
      redirect_to root_url, :flash => {:error => "Authentifizierungsfehler"}
    end
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user || current_user.role == User::ADMIN
      if @user.update_attributes(params[:user])
        redirect_to edit_user_path, :notice => "Daten geändert"
      else
        render :action => "edit"
      end
    else
      redirect_to root_url, :flash => {:error => "Authentifizierungsfehler"}
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Registrierung erfolgreich!"
    else
      render "new"
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user || current_user.role == User::ADMIN
      @user.destroy
      session.delete :user_id
	  redirect_to root_url, :notice => "Account gelöscht"
    else
      redirect_to root_url, :flash => {:error => "Authentifizierungsfehler"}
    end
  end
end
