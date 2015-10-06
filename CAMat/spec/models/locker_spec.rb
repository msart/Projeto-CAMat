require 'rails_helper'

describe Locker do
  before :each do
    @locker = FactoryGirl.create(:locker)
  end
  it "has a valid factory" do 
    expect(@locker).to be_valid
  end
  it "has a valid code" do
    expect(@locker.code).to match(/^[A-Z]\d{2}$/)
  end
  it "has a valid owner" do
    expect(@locker.owner).to match(/[a-zA-z\s]+/)
  end
end