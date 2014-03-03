class Assignment < ActiveRecord::Base
  belongs_to :organization
  belongs_to :project
end
