class Bounty < ActiveRecord::Base
  has_one :poster, class_name: 'User'
  belongs_to :issue

  # rails 4.1
  # enum currency: [ :btc, :usd ]
end
