class Issue < ActiveRecord::Base
  has_one :project
  belongs_to :milestone
  has_many :bids
  has_many :bounties
  has_many :labels
end
