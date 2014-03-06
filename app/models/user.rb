class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects, class_name: 'Project', foreign_key: 'owner_id'
  has_many :organizations
  has_many :bounties
  has_many :bids
end
