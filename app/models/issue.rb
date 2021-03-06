class Issue < ActiveRecord::Base
  belongs_to :project
  belongs_to :milestone
  has_many :bids
  has_many :bounties
  has_many :labels

  def leading_bid
    bids.first
  end

  def total_bounties
    bounties.collect(&:amount).sum
  end

  def url
    'http://github.com/%s/%s/issues/%s' % [project.owner.username, project.github_name, github_id]
  end
end
