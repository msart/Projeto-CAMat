class LockerController < ApplicationController
  def index
    @lockers = Locker.all
  end
end
