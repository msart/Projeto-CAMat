# -*- encoding : utf-8 -*-
require 'rails_helper'

describe Locker do
  describe "locker" do
    before do
      @locker = Locker.create(owner: "Test_Owner", code: "D10")
    end
    
    it "has a valid code" do
      expect(@locker.code).to match(/^[A-Z]\d{2}$/)
    end
    
    it "has a valid owner" do
      expect(@locker.owner).to match(/[a-zA-z\s]+/)
    end
  end
  
  describe ".free?" do
    before do
      @locker = Locker.create(owner: "Test_Owner", code: "D10")
    end
    it "must know if locker is occupied" do
      occupation = @locker.free?
      expect(occupation).to be false
    end
    before do
      @locker_without_owner = Locker.create(owner: "", code: "D10")
    end
    it "must know if locker is empty" do
      occupation = @locker_without_owner.free?
      expect(occupation).to be true
    end
  end
  
  describe ".number" do
    before do
      @locker = Locker.create(owner: "Test_Owner", code: "D10")
    end
    
    it "must return an integer" do
      expect(@locker.number).to be_a Integer
    end
    
    it "must know the number embedded in the locker's code" do
      expect(@locker.number).to be 10
    end
  end
  
  describe ".price" do
    before do
      @lowerlocker = Locker.create(owner: "Test_Owner", code: "D03")
      @upperlocker = Locker.create(owner: "Test_Owner", code: "D13")
    end
    
    it "must use the strategy for lower lockers" do
      expect(@lowerlocker.price).to eq "R$20,00"
    end
    
    it "must use the strategy for upper lockers" do
      expect(@upperlocker.price).to eq "R$30,00"
    end
  end
end

