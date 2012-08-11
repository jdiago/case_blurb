class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation

  has_secure_password

  has_and_belongs_to_many :cases

  validates :username, presence: true, uniqueness: true
end
