# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= nil

    # can :manage, :all
    guest_can
    user_can(user.id) if user.user_role?
    admin_can if user.admin?
  end

  private

  def guest_can
    can :read, [Post, Comment, Element]
  end

  def user_can(user_id)
    can :manage, [Post, Comment, Element], user_id: user_id
  end

  def admin_can
    can :manage, :all
  end
end
