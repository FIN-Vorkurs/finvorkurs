# Coding: UTF-8
class SessionsController < ApplicationController
	def new
	end

	def create
	  user = User.find_by_email(params[:email])
	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    redirect_to root_url, :notice => "Login erfolgreich"
	  else
	    flash.now.alert = "Ungültige Email oder Password"
	    render "new"
	  end
	end

    def with_token
      token = PasswordResetToken.find_by_token! params[:id]
      if token.created_at > 24.hours.ago && user = token.user
        session[:user_id] = user
      else
        flash.now.alert = "Token ist abgelaufen."
      end
      token.destroy
      redirect_to root_url, :notice => "Ändere bitte dein Passwort!"
    end


	def destroy
	  session.delete :user_id
	  redirect_to root_url, :notice => "Logout erfolgreich"
	end
end
