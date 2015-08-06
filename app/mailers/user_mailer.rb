class UserMailer < ApplicationMailer
  default from: 'rebecca.ades@gmail.com'

  def welcome_email(user)
    @user = user
    email_with_name = %("#{@user.name}" <#{@user.email}>)
    mail to: @user.email, subject: 'Welcome to Character Mapping!'
  end
end
