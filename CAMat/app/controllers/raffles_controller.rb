class RafflesController < ApplicationController
  def new
    
  end
  #TODO validações
  def create
    @raffle = Raffle.create(params[:raffle])
    if !@raffle.valid?
      flash[:notice] = "#{@raffle.errors.messages}"
      redirect_to new_raffle_path
    else 
      flash[:notice] = "Sorteio criado com sucesso."
      redirect_to user_path(session[:user_id])
    end
  end
  
  def delete
  end

  def edit
    @raffle = Raffle.find params[:id]
  end

  def update
    @raffle = Raffle.find params[:id]
    @raffle.update_attributes!(params[:raffle])
    flash[:notice] = "Os dados do sorteio foram atualizados com sucesso."
    redirect_to user_path(session[:user_id]) 
  end
end
