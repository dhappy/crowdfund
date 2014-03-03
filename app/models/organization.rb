class Organization < ActiveRecord::Base
  has_many :projects, through: :assignments
end
