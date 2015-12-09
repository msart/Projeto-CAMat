# -*- encoding : utf-8 -*-
class UserMailer < ActionMailer::Base


  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end

end
