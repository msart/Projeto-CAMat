# -*- encoding : utf-8 -*-
class LockersController < ApplicationController
  def index
    @lockers = Locker.all
  end
  
  def occupied_lockers_list
    @lockers = Locker.all
    @lockers.collect! do |locker|
      locker.set_strategy
      locker
    end
    @time = DateTime.now
  end
end
