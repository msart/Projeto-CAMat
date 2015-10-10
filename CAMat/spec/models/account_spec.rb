require 'rails_helper'

describe Account do
  shared_examples "all users" do
  	before do
    	@account = FactoryGirl.create(:account)
  	end

	it "has a valid factory"
		expect(@locker).to be_valid  
    end

	it "has a user"
	  	expect(@account.user).to match(/[a-zA-z\s]+/)
	end
	  
	it "has a locker"
	  	expect(@account.locker).to match(/^[A-Z]\d{2}$/)
	end

	it "has a expire date"
	  	expect(@account.expire_date).to match(/^[A-Z]\d{2}$/)
	end

	#it "can renew its expiration date"
  end
end

