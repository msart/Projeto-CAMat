class RafflesController < ApplicationController
  def new
    
  end
  #TODO validações
  def create
    params[:raffle][:start] = Datetime.parse(params[:raffle][:start])
    params[:raffle][:finish] = Datetime.parse(params[:raffle][:finish])
    @raffle = Raffle.create(params[:raffle])
    if !@raffle.valid?
      flash[:notice] = "#{@raffle.errors.messages}"
      redirect_to new_raffle_path
    else 
      flash[:notice] = "Sorteio criado com sucesso."
      redirect_to user_path(session[:user_id])
    end
  end

    def index
    if is_admin?
      @raffle = Raffle.all
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
    @raffle = Raffle.find params[:id]
  end

  def update
    @raffle = Raffle.find params[:id]
    @raffle.update_attributes!(params[:raffle])
    flash[:notice] = "Os dados do sorteio foram atualizados com sucesso."
    redirect_to user_path(session[:user_id]) 
  end
end
