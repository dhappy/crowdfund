class Project < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :assignments
  has_many :organizations, through: :assignments
  has_many :issues
end
