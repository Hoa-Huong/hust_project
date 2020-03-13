class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Teacher, Demand, Comment]

    return unless user

    if user.admin?
      can :manage, :all
    else
      can [:create, :update, :destroy], Comment, user_id: user.id
      can [:read, :create, :update, :my_demand], Demand, user_id: user.id
      can [:read, :create], TeachOffer
      can :destroy, TeachOffer, teacher: {user_id: user.id}
      can :read, Teacher, user_id: user.id
      can [:read, :create, :destroy], User, user_id: user.id
    end
  end
end
