# -*- encoding : utf-8 -*-
class AccountsController < ApplicationController

  def create
    @account = Account.find_by_user(params[:user])
    if @account == nil
      @account = Account.create!(locker: params[:locker], user: params[:user], expire_date: params[:expire_date])
    else
      @account.update_attributes!(locker: params[:locker], expire_date: params[:expire_date])
    end
    Locker.find_by_code(params[:locker]).update_attributes! owner: params[:user]
    flash[:notice] = "Armário obtido com sucesso!"
    refresh_dom_with_partial('#side_bar', 'shared/menu')
    redirect_to user_path(session[:user_id])
  end

  def destroy
  	Locker.find_by_code(User.find_by_id(params[:id]).locker).update_attributes! owner: ''
  	Account.find_by_user(User.find_by_id(params[:id]).nome).update_attributes! locker: '-'
  	flash[:notice] = "Você abandonou seu armário."
  	refresh_dom_with_partial('#side_bar', 'shared/menu')
  	redirect_to user_path(params[:id])
  end
end
