class UsersController < ApplicationController
  def new

  end

  def index
    @users = User.all
  end



  def create
  	@user = User.create!(params[:user])
  	flash[:notice] = "User criado com sucesso."
  	redirect_to users_path
  end

	private 
	def user_params 
		params.require(:user).permit(:nome, :email, :documento, :password, :password_confirmation, :telefone) 
	end

end
