class UsersController < ApplicationController
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
  	@user = User.create!(params[:user])
  	flash[:notice] = "User criado com sucesso."
  	redirect_to users_path
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes!(params[:user])
    flash[:notice] = "#{@user.nome} was successfully updated."
    redirect_to user_path(@user)
  end

	private 
	def user_params 
		params.require(:user).permit(:nome, :email, :documento, :password, :password_confirmation, :telefone) 
	end

end
