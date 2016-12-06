# -*- encoding : utf-8 -*-
module RafflesHelper

	def is_raffle_period?
		@raffle = Raffle.find_by_id(1)
		current = DateTime.now
		if current > @raffle.start && current < @raffle.finish
			return true
		end
		return false
	end
  
end
