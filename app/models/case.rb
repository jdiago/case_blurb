class Case < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :users
  has_many :docs
  has_many :blurbs

  validates :name, presence: true, uniqueness: true
end
