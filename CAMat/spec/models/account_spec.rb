require 'rails_helper'

describe Account do
  before :each do
    @account = FactoryGirl.create(:account)
  end
  it "has a valid factory"
  it "has a user"
  it "has a locker"
  it "has a expire date"
  it "can renew itsexpiration date"
end
