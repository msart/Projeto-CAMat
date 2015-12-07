# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  before_filter :authorize, except: [:new, :create]

  def new
  end

  def index
    if is_admin?
      @users = User.all
    else
      redirect_to user_path(session[:user_id])
    end
  end

  def show
    id = params[:id]
    @user = User.find(id)
  end

  def create
  	@user = User.create(params[:user])
    if !@user.valid?
      flash[:notice] = "#{@user.errors.messages}"
      redirect_to new_user_path
    else 
  	  flash[:notice] = "Usuário criado com sucesso."
  	  redirect_to login_path
    end
  end

  before_filter :correct_user?, only: [:edit, :update, :destroy, :show]
  before_filter :is_admin?, only: [:edit, :update, :destroy, :show]

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes!(params[:user])
    flash[:notice] = "Os dados de #{@user.nome} foram atualizados com sucesso."
    redirect_to user_path(@user) 
  end

  def destroy
    @user = User.find(params[:id])
    if @user.locker != '-'
      Locker.find_by_code(@user.locker).update_attributes! owner: ''
      Account.find_by_user(@user.nome).destroy
    end
    @user.destroy
    flash[:notice] = "Usuario apagado."
    if session[:user_id] == @user.id
      sign_out
  	  # Refresh the menu in the layout
      refresh_dom_with_partial('#login', 'sessions/log')
      refresh_dom_with_partial('#refresher', 'shared/content')
      redirect_to login_path
    else
  	  # Refresh the menu in the layout
      refresh_dom_with_partial('#login', 'sessions/log')
      refresh_dom_with_partial('#refresher', 'shared/content')
      redirect_to users_path
    end
  end

	private 
	def user_params 
		params.require(:user).permit(:nome, :email, :documento,  :telefone) 
	end

end
