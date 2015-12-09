# -*- encoding : utf-8 -*-
class PasswordResetsController < ApplicationController
  before_filter :get_user,         only: [:edit, :update]
  before_filter :valid_user,       only: [:edit, :update]
  before_filter :check_expiration, only: [:edit, :update]

  def new
  end

  def create
  	if params[:password_reset]
  		@user = User.find_by_email(params[:password_reset][:email])
  		if @user
  			@user.create_reset_digest
	  		@user.send_password_reset_email
	  		flash[:caution] = "Email enviado com as intruções."
	  		render 'new'
	  	else
	  		flash[:caution] = "Email não achado."
	  		render 'new'
	  	end
	else
		render 'new'
	end
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Senha foi resetada."
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    # Before filters

    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_user
      unless (@user && @user.activated? &&
              @user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    # Checks expiration of reset token.
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Link expirou."
        redirect_to new_password_reset_url
      end
    end
end
