# -*- encoding : utf-8 -*-
class RequirementRafflesController < ApplicationController
  def new    
  end
  
  def create
    @raffle = RequirementRaffle.create(start: params[:start], finish: params[:finish], locker: params[:locker])
    @raffle.delay.run_raffle
    flash[:notice] = "Inscrito no Sorteio."
    redirect_to user_path(session[:user_id])
  end
  
  def subscribe
    user = User.find(session[:user_id])
    raffle = RequirementRaffle.find_by_locker(params[:locker])
    if !raffle.present?
      raffle = RequirementRaffle.create(start: params[:start], finish: params[:finish], locker: params[:locker])
      raffle.delay.run_raffle
    end
    user.update_attribute(:requirement_raffle_id, raffle.id)
    #raffle.user << user
    #Raffle.find(1).users << user
    flash[:notice] = "Inscrito no Sorteio."
    refresh_dom_with_partial('#side_bar', 'shared/menu')
    redirect_to user_path(session[:user_id])
  end

  def unsubscribe
    user = User.find(session[:user_id])
    user.update_attribute(:requirement_raffle_id, nil)
    flash[:notice] = "Você abandonou sua inscrição."
    refresh_dom_with_partial('#side_bar', 'shared/menu')
    redirect_to user_path(session[:user_id])
  end

  def index
    if is_admin?
      @raffles = RequirementRaffle.all
    else
      redirect_to user_path(session[:user_id])
    end
  end

  def show
    id = params[:id]
    @raffle = RequirementRaffle.find(id)
    @users = @raffle.users
  end

  def destroy
    @raffle = RequirementRaffle.find(params[:id])
    @raffle.destroy
    refresh_dom_with_partial('#side_bar', 'shared/menu')
    redirect_to requirement_raffles_path
  end
end
