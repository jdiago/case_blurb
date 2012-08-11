class Blurb < ActiveRecord::Base
  attr_accessible :content
  belongs_to :case
end
