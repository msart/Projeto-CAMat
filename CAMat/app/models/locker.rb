# -*- encoding : utf-8 -*-
class Locker < ActiveRecord::Base
  attr_accessible :code, :owner
  
  def self.locker_occupation_hash
    locker_occupation_hash = Hash.new('')
    Locker.all.each do |locker|
    	locker_occupation_hash[locker.code] = locker.is_occupied?
    end
    
    return locker_occupation_hash
  end
  
  def price
		locker_number = 2
		price = 0
		if(locker_number < 9)
	 	  price = 20	# price strategy 1
		else
			price = 30 # price strategy 2
		end
		return price 
  end
  
  def free?
  	return owner.to_s == ""
  end
end

