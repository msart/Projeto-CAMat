# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
  	  # Refresh the menu in the layout
      refresh_dom_with_partial('#login', 'log')
      refresh_dom_with_partial('#refresher', 'shared/content')
      redirect_to user_path(id: session[:user_id])
    else
      flash[:warning] = 'Combinação email/senha inválida'
  	  # Refresh the menu in the layout
      refresh_dom_with_partial('#login', 'log')
      render :action => '../home/index'
    end
  end

  def destroy
  	sign_out
  	# Refresh the menu in the layout
    refresh_dom_with_partial('#refresher', 'shared/content')
    refresh_dom_with_partial('#login', 'log')
    redirect_to home_path, :notice => 'Logged Out!'
  end
end
