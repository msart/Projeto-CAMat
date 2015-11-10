class RafflesController < ApplicationController
  def new    
  end
  #TODO validações, delay
  def create
    params[:raffle][:start] = DateTime.parse(params[:raffle][:start])
    params[:raffle][:finish] = DateTime.parse(params[:raffle][:finish])
    @raffle = Raffle.create(params[:raffle])
    @raffle.delay.run_raffle
    flash[:notice] = "Sorteio criado com sucesso."
    redirect_to user_path(session[:user_id])
  end

  def unsubscribe
    user = User.find(session[:user_id])
    user.update_attribute(:raffle_id, nil)
    flash[:notice] = "Voce abandonou sua inscricao."
    redirect_to user_path(session[:user_id])
  end
  
  def subscribe
    user = User.find(session[:user_id])
    user.update_attribute(:raffle_id, 1)
    #Raffle.find(1).users << user
    flash[:notice] = "Voce se inscreveu no sorteio."
    redirect_to user_path(session[:user_id])
  end
  
  def index
    if is_admin?
      @raffles = Raffle.all
    else
      redirect_to user_path(session[:user_id])
    end
  end

  before_filter :is_admin?, only: [:edit, :update, :destroy, :show]

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
    redirect_to raffle_path
  end

  def edit
    @raffle = Raffle.find(params[:id])
  end

  def update
    @raffle = Raffle.find(params[:id])
    @raffle.update_attributes!(params[:raffle])
    flash[:notice] = "Os dados do sorteio foram atualizados com sucesso."
    redirect_to user_path(session[:user_id]) 
  end
end
