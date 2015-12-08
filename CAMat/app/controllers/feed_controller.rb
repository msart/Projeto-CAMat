class FeedController < ApplicationController
	before_filter :is_admin?, only: [:edit, :update]

	def new
	end

	def create
  		@feed = Feed.create(params[:feed])
  	  	flash[:notice] = "Mensagem criada com sucesso."
  	  	redirect_to user_path(session[:user_id]) 
  	end

	def edit
		@feed = Feed.find params[:id]
	end

	def update
		@feed = Feed.find params[:id]
    	@feed.update_attributes!(params[:feed])
    	flash[:notice] = "Mensagem atualizada com sucesso."
    	redirect_to user_path(session[:user_id]) 
	end
end
