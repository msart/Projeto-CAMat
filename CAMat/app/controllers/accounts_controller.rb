class AccountsController < ApplicationController
  
  def create
    @account = Account.create!(params)
    flash[:notice] = "Armario obtido com sucesso!"
    redirect_to users_path
  end
end
