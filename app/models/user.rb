# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  attr_accessible :email, :nome, :documento, :telefone, :password, :password_confirmation, :admin
  attr_accessible :reset_token, :remember_token
  belongs_to :raffle
  belongs_to :requirement_raffle
  validates :nome, presence: true, length: { maximum: 50 }

  before_save { self.email = email.downcase } 
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }, uniqueness: { case_sensitive: false } 

  validates :password, presence: true, length: { minimum: 6 }
  
  validates :documento, presence: true, uniqueness: { case_sensitive: false }

  validates :telefone, presence: true

  has_secure_password

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_emaiil
    UserMailer.password_reset(self).deliver_now
  end
  
  def locker
     account = Account.find_by_user(nome)
    if account
      return account.locker
    else
      return "-"
    end
  end

end
