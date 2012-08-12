class Doc < ActiveRecord::Base
  attr_accessible :name

  belongs_to :case

  validates :name, presence: true
end
