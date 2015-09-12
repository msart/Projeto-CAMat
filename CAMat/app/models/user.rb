class User < ActiveRecord::Base
  attr_accessible :email, :nome, :documento

  validates :nome, presence: true, length: { maximum: 50 }

  before_save { self.email = email.downcase } 
  validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create}, uniqueness: {case_sensitive: false} 

  validates :password, presence: true, length: { minimum: 6 }
  
  validates :documento, presence: true, uniqueness:

  has_secure_password 
  end
end
