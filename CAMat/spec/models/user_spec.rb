require 'rails_helper'

describe User do
  before :each do
    @userAdmin = FactoryGirl.create(:userAdmin)
    @userNormal = FactoryGirl.create(:userNormal)
  end
  it "is invalid without a nome"
  it "is invalid without a telefone"
  it "is invalid without a email"
  it "is invalid without a documento"
  it "is invalid withou a password"
  it "is a admin" 
  it "is not a admin"
end
