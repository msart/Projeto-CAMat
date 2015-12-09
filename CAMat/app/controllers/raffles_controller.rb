# -*- encoding : utf-8 -*-
class RafflesController < ApplicationController
  def new    
  end
  #TODO validações, delay
  def create
    params[:raffle][:start] = DateTime.parse(params[:raffle][:start])
    params[:raffle][:finish] = DateTime.parse(params[:raffle][:finish])
    @raffle = Raffle.create(params[:raffle])
    @raffle.delay.run_raffle(params[:locker])
    flash[:notice] = "Inscrito no Sorteio."
    redirect_to raffles_path
  end

  def unsubscribe
    user = User.find(session[:user_id])
    user.update_attribute(:raffle_id, nil)
    flash[:notice] = "Você abandonou sua inscrição."
    refresh_dom_with_partial('#side_bar', 'shared/menu')
    redirect_to user_path(session[:user_id])
  end
  
  def subscribe
    user = User.find(session[:user_id])
    user.update_attribute(:raffle_id, 1)
    #Raffle.find(1).users << user
    flash[:notice] = "Você se inscreveu no sorteio."
    refresh_dom_with_partial('#side_bar', 'shared/menu')
    redirect_to user_path(session[:user_id])
  end

  before_filter :is_admin?, only: [:edit, :update, :destroy, :show, :index]
  
  def index
    if is_admin?
      @raffles = Raffle.all
    else
      redirect_to user_path(session[:user_id])
    end
  end

  def show
    id = params[:id]
    @raffle = Raffle.find(id)
    @users = @raffle.users
  end
  
  def delete
  end

  def destroy
    @raffle = Raffle.find(params[:id])
    @raffle.destroy
    redirect_to raffles_path
  end

  def edit
    @raffle = Raffle.find(params[:id])
  end

  def update
    @raffle = Raffle.find(params[:id])
    @raffle.update_attributes!(params[:raffle])
    flash[:notice] = "Os dados do sorteio foram atualizados com sucesso."
    refresh_dom_with_partial('#side_bar', 'shared/menu')
    redirect_to raffle_path(params[:id])
  end
end
