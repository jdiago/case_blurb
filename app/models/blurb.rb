class Blurb < ActiveRecord::Base
  attr_accessible :content, :case_id
  belongs_to :case
  validates :case_id, presence: true
end
