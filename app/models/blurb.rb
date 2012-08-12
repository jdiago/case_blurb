class Blurb < ActiveRecord::Base
  attr_accessible :content, :case_id, :user_id
  belongs_to :case
  validates :case_id, :user_id, presence: true
end
