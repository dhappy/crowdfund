class Bid < ActiveRecord::Base
  belongs_to :bidder, class_name: 'User'
  belongs_to :issue

  def rate
    self[:rate] or bidder.rate
  end
end
