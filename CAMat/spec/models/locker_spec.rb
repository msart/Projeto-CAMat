require 'rails_helper'

describe Locker do
  shared_examples "all lockers" do
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
  describe "locker" do
    before do
      @locker = FactoryGirl.create(:locker)
    end
    include_examples "all lockers"
  end
  describe ".is_locker_occupied?" do
    before do
      @locker = FactoryGirl.create(:locker)
    end
    it "must know if locker is occupied" do #falhou!!
      expect(Locker).to receive(:is_locker_occupied?).with(@locker.code)
      @occupation = Locker.is_locker_occupied?(@locker.code)
      if @locker.owner == ""
        expect(@occupation).to be false
      else
        expect(@occupation).to be true
      end
    end
  end
end