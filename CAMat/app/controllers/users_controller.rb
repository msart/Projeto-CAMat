class UsersController < ApplicationController
  #before_filter :authorize, except: [:new, :create]

  def new
  end

  def index
    @users = User.all
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
  	  flash[:notice] = "User criado com sucesso."
  	  redirect_to login_path
    end
  end
  before_filter :correct_user?, only: [:edit, :update, :destroy]

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes!(params[:user])
    flash[:notice] = "Os dados de #{@user.nome} foi atualizado com sucesso."
    redirect_to user_path(@user) 
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Usuario apagado."
    sign_out 
    redirect_to login_path
  end

	private 
	def user_params 
		params.require(:user).permit(:nome, :email, :documento, :password, :password_confirmation, :telefone) 
	end

end
