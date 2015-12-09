class RequirementRaffle < ActiveRecord::Base
  attr_accessible :finish, :locker_code, :start
end
