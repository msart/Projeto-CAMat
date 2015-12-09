# -*- encoding : utf-8 -*-
require 'rails_helper'

describe Feed do
	shared_examples "all feeds" do
    	it "has a valid factory" do 
      		expect(@feed).to be_valid
      	end
    end

    describe "feed" do
    	before do
      		@feed = FactoryGirl.create(:feed)
    	end
    	include_examples "all feeds"
  	end
end
