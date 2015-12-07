# -*- encoding : utf-8 -*-
require 'rails_helper'

describe Raffle do
	shared_examples "all raffles" do
    	it "has a valid factory" do 
      		expect(@raffle).to be_valid
      	end
    end

    describe "raffle" do
    	before do
      		@raffle = FactoryGirl.create(:raffle)
    	end
    	include_examples "all raffles"
  	end
end
