# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include UsersHelper

  def authorize
    unless logged_in?
     redirect_to login_path
    end 
  end

  def correct_user?
   @user = User.find(params[:id])
   unless current_user == @user || current_user.admin
     redirect_to users_path
   end 
  end
end
