class AccountsController < ApplicationController
  
  def create
    @account = Account.create!(params[:account])
    Locker.find_by_code(params[:locker]).update_attributes! owner: params[:user]
    flash[:notice] = "Armario obtido com sucesso! #{Locker.find_by_code(params[:locker]).owner}"
    redirect_to users_path
  end
end
