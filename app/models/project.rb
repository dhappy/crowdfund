class Project < ActiveRecord::Base
  has_one :owner, class_name: 'User'
  has_many :organizations, through: :assignments
  has_many :issues
end
