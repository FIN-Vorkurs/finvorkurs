# Coding: UTF-8
class UserMailer < ActionMailer::Base
  default from: "vorkurs@farafin.de"

  def password_reset user
    @user = user
    mail :to => user.email, :subject => "Passwort zurücksetzen"
  end

  def send_newsletter_to_user user, post
    @user = user
    @post = post
    mail to: user.email, subject: post.title
  end
end
