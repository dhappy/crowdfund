class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  # :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable

  validates_uniqueness_of :email, case_sensitive: false, allow_blank: true, if: :email_changed?
  validates_format_of :email, with: Devise.email_regexp, allow_blank: true, if: :email_changed?
  validates_confirmation_of :password, on: :create
  validates_length_of :password, within: Devise.password_length, allow_blank: true

  has_and_belongs_to_many :roles, -> { uniq }
  has_many :projects, class_name: 'Project', foreign_key: 'owner_id'
  has_many :organizations
  has_many :bounties
  has_many :bids
  has_many :authentications

  def full_name
    email || 'No Name'
  end

  def role? role
    roles.collect(&:name).map(&:downcase).include? role.to_s
  end
end
