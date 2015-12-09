# -*- encoding : utf-8 -*-
class RequirementRafflesController < ApplicationController
  def new    
  end
  
  def create
    @raffle = RequirementRaffle.create(params[:requerimentraffle])
    @raffle.delay.run_raffle
    flash[:notice] = "Inscrito no Sorteio."
    redirect_to user_path(session[:user_id])
  end
  
  def subscribe
    user = User.find(session[:user_id])
    raffle = RequirementRaffle.find_by_locker(params[:locker])
    if !raffle.present?
      raffle = RequirementRaffle.create(params)
      raffle.delay.run_raffle
    end
    raffle.user << user
    #Raffle.find(1).users << user
    flash[:notice] = "Inscrito no Sorteio."
    refresh_dom_with_partial('#side_bar', 'shared/menu')
    redirect_to user_path(session[:user_id])
  end
end
