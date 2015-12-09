# -*- encoding : utf-8 -*-
module LockerHelper

	def locker_price(locker_code)
		locker_number = Integer(locker_code.scan(/\d/).join(''),10)
		price = 0
		if(locker_number < 9)
 	   		price = 20
		else
			price = 30
		end
		return price 
	end

end
