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
    check_permission!
  end

  def update
    params[:user].delete(:role) unless params[:user][:role].to_i <= @current_user.role

    @user = User.find(params[:id])
    check_permission!
    if @user.update_attributes(params[:user])
      redirect_to edit_user_path, :notice => "Daten geändert"
    else
      render :action => "edit"
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      # send_notification_to_admins @user
      redirect_to root_url, :notice => "Registrierung erfolgreich!"
    else
      render "new"
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      @user.destroy
      session.delete :user_id
	  redirect_to root_url, :notice => "Account gelöscht"
    elsif current_user.role == User::ADMIN
      @user.destroy
      redirect_to :users, :notice => "Account gelöscht"
    else
      exit
    end
  end

  private

  def check_permission!
    unless @user == current_user 
      abort "No Permission"
    end
  end

  def send_notification_to_admins user
    admins = User.find_all_by_role User::ADMIN
    admins.each do |a|
      a.send_new_user_notification user
    end
  end
end
