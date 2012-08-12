class Blurb < ActiveRecord::Base
  attr_accessible :content, :case_id, :user_id
  belongs_to :case
  belongs_to :user
  validates :case_id, :user_id, presence: true
end
