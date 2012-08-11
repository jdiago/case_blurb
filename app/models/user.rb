class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation
  has_secure_password

  validates :username, presence: true, uniqueness: true
end
