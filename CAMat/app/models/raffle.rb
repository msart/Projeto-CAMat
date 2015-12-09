# -*- encoding : utf-8 -*-
class Raffle < ActiveRecord::Base
  attr_accessible :finish, :start, :users
  has_many :users

  def run_raffle
    free_lockers = Locker.locker_occupation_hash.select {|locker, occupation| occupation == "Livre"}
    this.users.each do |user|
      subscribed_users << user.nome      
    end
    subscribed_users.shuffle!
    free_lockers.each_key do |locker|
      user = subscribed_user.pop
      if (user == nil)
        break
      end
      Account.create locker: locker, user: user, expire_date: 1.year.from_now
    end
    
    this.users.each do |user|
      user.update_attribute(:raffle_id, nil)
    end

  end
  handle_asynchronously :run_raffle, :run_at => Proc.new {finish.to_time}
  
end
