class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.role? :admin
      can :manage, :all
    else
      can :read, :all
      can :create, [Bid, Bounty]
      cannot :read, User

      if user.role? :manager
        can :manage, [Organization, Project, Issue, Bid, Bounty]
      end
    end
  end
end
