class AccountsController < ApplicationController
  
  def create
    @account = Account.create!(locker: params[:locker], user: params[:user], expire_date: params[:expire_date])
    Locker.find_by_code(params[:locker]).update_attributes! owner: params[:user]
    flash[:notice] = "Armario obtido com sucesso!"
    redirect_to users_path
  end

  def destroy
  	Locker.find_by_code(User.find_by_id(params[:id]).locker).update_attributes! owner: ''
  	Account.find_by_user(User.find_by_id(params[:id]).nome).destroy
  	flash[:notice] = "Armario liberado com sucesso!"
  	redirect_to user_path(params[:id])
  end
end
