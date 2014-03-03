class Organization < ActiveRecord::Base
  has_many :assignments
  has_many :projects, through: :assignments
end
