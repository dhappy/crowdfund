class Bounty < ActiveRecord::Base
  has_one :poster, class_name: 'User'
end
