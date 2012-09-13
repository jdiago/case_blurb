class Case < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :users
  has_many :docs, dependent: :destroy
  has_many :blurbs, dependent: :destroy

  validates :name, presence: true
end
