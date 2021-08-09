# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= nil

    guest_can
    user_can(user.id) if user.user_role?
    admin_can if user.admin?
  end

  private

  def guest_can
    can :read, [Post, Comment]
  end
  
  def user_can(user_id)
    can :manage, [Post, Comment], user_id: user_id
    # can :manage, :all
  end

  def admin_can
    can :manage, :all
  end
end
