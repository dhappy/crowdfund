class Issue < ActiveRecord::Base
  has_one :project
  has_many :bids
  has_many :bounties
end
