# -*- encoding : utf-8 -*-
class Locker < ActiveRecord::Base
  attr_accessible :code, :owner
  
  def self.locker_occupation_hash
    locker_occupation_hash = Hash.new('')
    Locker.all.each do |locker|
      if Locker.find_by_code(locker.code).owner == '' #dando find dentro de find, achar solução
        locker_occupation_hash[locker.code] = "Livre" 
      else
        locker_occupation_hash[locker.code] = "Ocupado"
      end
    end
    locker_occupation_hash
  end
  
  def price(locker_code)
	locker_number = Integer(locker_code.scan(/\d/).join(''),10)
	price = 0
	if(locker_number < 9)
 	   price = 20
	else
		price = 30
	end
	return price 
  end
  
  def self.is_locker_occupied?(locker_code)
    Locker.find_by_code(locker_code).owner != ""
  end
end
