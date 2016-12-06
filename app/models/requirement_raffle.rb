class RequirementRaffle < ActiveRecord::Base
  attr_accessible :finish, :locker, :start
  has_many :users

  def run_raffle
    subscribed_users = this.users.shuffle
    Account.create locker: locker, user: subscribed_users.pop, expire_date: 1.year.from_now
    this.destroy
  end
  handle_asynchronously :run_raffle, :run_at => Proc.new {finish.to_time}
end
