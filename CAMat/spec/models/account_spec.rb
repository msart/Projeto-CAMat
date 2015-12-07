# -*- encoding : utf-8 -*-
require 'rails_helper'

describe Account do
  	before do
    	@account = FactoryGirl.create(:account)
  	end

	it "has a valid factory" do
		expect(@account).to be_valid  
    end

	it "has a user" do 
	  	expect(@account.user).to match(/[a-zA-z\s]+/)
	end
	  
	it "has a locker" do
	  	expect(@account.locker).to match(/^[A-Z]\d{2}$/)
	end

	it "has a expire date" do
	  	expect(@account.expire_date)
	end

	#it "can renew its expiration date"
end

