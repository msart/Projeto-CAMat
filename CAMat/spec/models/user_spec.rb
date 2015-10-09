require 'rails_helper'

describe User do
  
  before :each do
    @user = FactoryGirl.create(:user)
    @user_not_admin = FactoryGirl.create(:user)
  end
  

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
  
  
  describe "admin?" do
    it "must know if the user is a admin or not" do
      expect( @user.admin? ).to be_truthy 
      expect( @user_not_admin.admin? ).to be_falsey
    end
  end

  describe "has locker" do
    it "must check if the user has a locker or not" do
      FactoryGirl.create(:locker, owner: "Pedro Marcondes", code: "C07")
      expect( @user.locker ).present?
      expect( @user_not_admin.locker ).to eq ("-")
    end
  end

end