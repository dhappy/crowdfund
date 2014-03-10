class Issue < ActiveRecord::Base
  belongs_to :project
  belongs_to :milestone
  has_many :bids
  has_many :bounties
  has_many :labels
end
