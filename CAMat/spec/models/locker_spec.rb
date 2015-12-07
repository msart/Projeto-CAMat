# -*- encoding : utf-8 -*-
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
    it "must know if locker is occupied" do
      occupation = Locker.is_locker_occupied?(@locker.code)
      expect(occupation).to be true
    end
    before do
      @locker_without_owner = FactoryGirl.create(:locker, owner: "", code: "D10")
    end
    it "must know if locker is empty" do
      occupation = Locker.is_locker_occupied?(@locker_without_owner.code)
      expect(occupation).to be false
    end
  end
  
  describe ".locker_occupation_hash" do
    before do
      FactoryGirl.create(:locker)
      FactoryGirl.create(:locker, owner: "Stefan", code: "C07")
    end
    it "must return the hash of all lockers" do
      expect(Locker.locker_occupation_hash).to eq({"D02"=>"Ocupado", "C07"=>"Ocupado"})
    end
  end
  
end
