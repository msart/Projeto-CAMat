# -*- encoding : utf-8 -*-
module UsersHelper
	def is_admin?
		current_user.admin
	end
	
	def is_subscribed?
	  current_user.raffle != nil
	end

	def have_requirement?
		current_user.requirement_raffle != nil
	end
end
