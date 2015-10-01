class AccountsController < ApplicationController
  
  def create
    @account = Account.create!(locker: params[:locker], user: params[:user], expire_date: params[:expire_date])
    Locker.find_by_code(params[:locker]).update_attributes! owner: params[:user]
    flash[:notice] = "Armario obtido com sucesso! #{Account.all}"
    redirect_to users_path
  end
end
