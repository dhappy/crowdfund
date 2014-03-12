class Issue < ActiveRecord::Base
  belongs_to :project
  belongs_to :milestone
  has_many :bids
  has_many :bounties
  has_many :labels

  def leading_bid
   # bids.first
    bid_first = bids.first
    bid_first.nil? ? nil : bid_first[:id]
  end

  def total_bounties
    bounties.collect(&:amount).sum
  end
end
