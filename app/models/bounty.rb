class Bounty < ActiveRecord::Base
  has_one :poster, class_name: 'User'
  has_one :issue
end
