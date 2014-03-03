class Bid < ActiveRecord::Base
  has_one :bidder, class_name: 'User'
end
