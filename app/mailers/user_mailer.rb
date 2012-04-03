# Coding: UTF-8
class UserMailer < ActionMailer::Base
  default from: "vorkurs@farafin.de"

  def password_reset user
    @user = user
    mail :to => user.email, :subject => "Passwort zurücksetzen"
  end
end
