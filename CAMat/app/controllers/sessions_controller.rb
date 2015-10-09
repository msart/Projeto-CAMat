class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user_path(id: session[:user_id])
    else
      flash[:warning] = 'Combinacao email/senha invalida'
      render :action => 'new'
    end
  end

  def destroy
  	sign_out
    redirect_to login_path, :notice => 'Logged Out!'
  end
end
