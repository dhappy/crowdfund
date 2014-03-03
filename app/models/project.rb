class Project < ActiveRecord::Base
  has_many :issues
  has_one :owner, class_name: 'User'
end
