class UsersController < ApplicationController
	before_filter :authenticate_user!, :except => [:new, :create]
	def new
		@user = User.new
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
