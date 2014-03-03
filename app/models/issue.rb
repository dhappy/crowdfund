class Issue < ActiveRecord::Base
  has_one :project
  has_one :milestone
  has_many :bids
  has_many :bounties
  has_many :labels
end
