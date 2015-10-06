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
    #TODO: retorna os preços baseando-se no código do armário
  end
  
  def is_locker_occupied?(locker_code)
    Locker.find(:all, :code => locker_code).owner != ''
  end
end