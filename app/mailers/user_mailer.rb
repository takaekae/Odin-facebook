class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url = 'http://mysite.com/login'
    mail(to: @user.email, subject: 'Welcome to My Website!')
  end
end
