# -*- encoding : utf-8 -*-
class LockersController < ApplicationController
  def index
    @lockers = Locker.all
  end
  
  def occupied_lockers_list
    @lockers = Locker.all
    @time = DateTime.now
  end
end
