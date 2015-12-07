# -*- encoding : utf-8 -*-
module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def block_access
    if current_user.present?
     redirect_to users_path
    end 
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end

end
