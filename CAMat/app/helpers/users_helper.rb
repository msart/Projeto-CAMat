# -*- encoding : utf-8 -*-
module UsersHelper
	def is_admin?
		current_user.admin
	end
	
	def is_subscribed?
	  current_user.raffle != nil
	end
end
