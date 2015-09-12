class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		redirect_to users_path, notice: "Usuário foi criado!"
  	else
  		render action:new
  	end	
  end

	private 
	def user_params 
		params.require(:user).permit(:nome, :email, :documento, :password, :password_confirmation) 
	end

end
