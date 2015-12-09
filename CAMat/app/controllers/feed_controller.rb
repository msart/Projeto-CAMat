# -*- encoding : utf-8 -*-
class FeedController < ApplicationController
	before_filter :is_admin?, only: [:edit, :update]

	def new
	end

	def create
  		@feed = Feed.create(params[:feed])
  	  	flash[:notice] = "Mensagem criada com sucesso."
  	  	redirect_to home_path
  	end

	def edit
		@feed = Feed.find params[:id]
	end

	def update
		@feed = Feed.find params[:id]
		time = Time.now
		time = "(#{time.day}/#{time.month}/#{time.year}-#{time.hour}:#{time.min}:#{time.sec})\n\n"
		@feed.update_attributes(params[:feed])
    	@feed.update_attributes!(msg: time+@feed.msg)
    	flash[:notice] = "Mensagem atualizada com sucesso."
    	redirect_to home_path
	end
end
