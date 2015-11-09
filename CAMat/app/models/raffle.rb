class Raffle < ActiveRecord::Base
  attr_accessible :finish, :start
  has_many :users  

  def run_raffle
    free_lockers = Locker.locker_occupation_hash.select {|locker, occupation| occupation == "Livre"}
    subscribed_users = this.users.shuffle
    free_lockers.each_key do |locker|
      user = subscribed_user.pop
      if (user == nil)
        break
      end
      Account.create locker: locker, user: user, expire_date: 1.year.from_now
    end
    this.destroy
  end
  handle_asynchronously :run_raffle, :run_at => finish.to_time
  
  def run_raffle(locker)
    subscribed_users = this.users.shuffle
    Account.create locker: locker, user: subscribed_users.pop, expire_date: 1.year.from_now
    this.destroy
  end
  handle_asynchronously :run_raffle, :run_at => finish.to_time
end
