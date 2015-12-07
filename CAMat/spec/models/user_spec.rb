# -*- encoding : utf-8 -*-
require 'rails_helper'

describe User do
  shared_examples "all users" do
    it "has a valid factory" do 
      expect(@user).to be_valid
    end
    
    it "is invalid without a nome" do
      expect(@user.nome ).to match(/[a-zA-z\s]+/)
    end
    
    it "is invalid without a telefone" do
      expect(@user.telefone ).to match(/^\d*$/)
    end
    
    it "is invalid without a email" do
     expect(@user.email).to match(/[\w*]+@+[\w*]+[.]+.*/)
    end
  
    it "is invalid without a documento" do
      expect(@user.documento ).to match(/^\d*$/)
    end
  
    it "is invalid without a password" do
      @user.password.present?
    end
  end
  
  describe "#admin?" do
    before do
      @user = FactoryGirl.create(:user)
      @user_not_admin = FactoryGirl.create(:user)
    end
    
    it "must know if the user is an admin or not" do
      expect( @user.admin? ).to be true 
      expect( @user_not_admin.admin? ).to be false
    end
  end
  
  describe "admin" do
    before do
      @user = FactoryGirl.create(:user, admin: true)      
    end
    
    include_examples "all users"
    
    it "must be an admin" do
      expect(@user.admin?).to be true  
    end
  end
  
  describe "common" do
    before do
      @user = FactoryGirl.create(:user, admin: false)
    end
    
    include_examples "all users"
    
    it "must not be an admin" do
      expect(@user.admin?).to be false
    end
  end

  describe "#locker" do
    before do
      @user1 = FactoryGirl.create(:user, nome: "Pedro Marcondes")
      @user2 = FactoryGirl.create(:user, nome: "Felipe Moreira")
      FactoryGirl.create(:locker, owner: "Pedro Marcondes", code: "C07")
      FactoryGirl.create(:account)
    end
    it "must check if the user has a locker or not" do
      expect( @user1.locker ).to eq("C07")
      expect( @user2.locker ).to eq("-")
    end
  end

end
