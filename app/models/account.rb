# -*- encoding : utf-8 -*-
class Account < ActiveRecord::Base
  #maybe change locker to locker_code
  attr_accessible :expire_date, :locker, :user
=begin
  def initialize(user, locker_code, rent_duration)
    #garatir que o usuário já não tem conta e que o armário não foi alugado
    self.user = user
    self.locker = locker_code
    self.expire_date = (Datetime.now.time + rent_duration*24*3600).to_datetime
  end
=end    
  def renew(duration)
    #expire_date += duration
  end
end
