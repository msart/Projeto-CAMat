class User < ActiveRecord::Base
  attr_accessible :email, :nome, :documento, :telefone, :password, :password_confirmation, :admin
  belongs_to :raffle
  validates :nome, presence: true, length: { maximum: 50 }

  before_save { self.email = email.downcase } 
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }, uniqueness: { case_sensitive: false } 

  validates :password, presence: true, length: { minimum: 6 }
  
  validates :documento, presence: true, uniqueness: { case_sensitive: false }

  validates :telefone, presence: true

  has_secure_password
  
  def locker
     account = Account.find_by_user(nome)
    if account
      return account.locker
    else
      return "-"
    end
  end

end
